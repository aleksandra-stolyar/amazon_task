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
  after_create :add_admin_role

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def role?(role) 
    !roles.find_by_name(role.to_s).nil?
  end 

  def has_role?(name)
    self.roles.where(name: name).length > 0
  end

  private
  def set_default_role
    self.roles << Role.find_by_name('customer')
  end

  def add_admin_role
    if self.roles > 2
      self.roles.first.delete
    end
  end

end
