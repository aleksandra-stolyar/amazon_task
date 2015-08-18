class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook]

  validates :email, :password, presence: true
  validates :email, uniqueness: true

  has_many :orders
  has_many :ratings
  has_and_belongs_to_many :roles

  before_create :set_default_role

  mount_uploader :avatar, AvatarUploader


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name
      user.avatar = auth.info.image
      user.oauth_token = auth.credentials.token
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

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
