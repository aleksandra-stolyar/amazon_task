class Customer < ActiveRecord::Base
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook]

  validates :email, :password, :first_name, :last_name, presence: true
  validates :email, uniqueness: true


  has_many :orders
  has_many :ratings

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |customer|
      customer.email = auth.info.email
      customer.password = Devise.friendly_token[0,20]
      customer.name = auth.info.name   # assuming the customer model has a name
      customer.image = auth.info.image # assuming the customer model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |customer|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        customer.email = data["email"] if customer.email.blank?
      end
    end
  end

end
