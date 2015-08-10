class Book < ActiveRecord::Base
  validates :title, :price, :amount, presence: true

  belongs_to :author
  has_and_belongs_to_many :categories

  has_many :ratings

  mount_uploader :cover, CoverUploader
  
end
