class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook]
  attr_accessor :password, :password_confirmation, :current_password

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create
  validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true

  has_many :orders
  has_many :ratings
  has_and_belongs_to_many :roles

  has_one :billing_address, class_name: "Address", as: :addressable, dependent: :destroy
  has_one :shipping_address, class_name: "Address", as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :billing_address, :shipping_address

  before_create :set_default_role

  mount_uploader :avatar, AvatarUploader



  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      if auth.info.image.present?
        user.update_attribute(:avatar, auth.info.image.gsub('http://','https://'))
      end
      user
    else
      User.create!(:email => auth.info.email,
                   :uid => auth.uid,
                   :first_name => auth.info.name,
                   :remote_avatar_url => auth.info.image.gsub('http://','https://'),
                   :password => Devise.friendly_token[0,20])
    end
  end
  # --------------------------------------------
  # add if new provider needed
  # --------------------------------------------
  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end

  def role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  def full_name
    unless last_name.nil?
      (first_name + " " + last_name)
    else  
      first_name
    end  
  end

  private
  def set_default_role
    self.roles << Role.find_by_name('customer')
  end
end
