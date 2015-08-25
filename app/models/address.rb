class Address < ActiveRecord::Base
  validates :address, :zip_code, :city, :phone, :country, presence: true
  
  belongs_to :order
  belongs_to :addressable, polymorphic: true
  self.inheritance_column = :address_type

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
end
