class Category < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true

  has_and_belongs_to_many :books
end
