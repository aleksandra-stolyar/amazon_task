class Book < ActiveRecord::Base
  validates :title, :price, :amount, presence: true

  belongs_to :author
  has_and_belongs_to_many :categories

  has_many :ratings

  mount_uploader :cover, CoverUploader

  def count_average_rate
    if ratings.calculate(:count, :all) != 0
      ratings.sum(:rate)/ratings.calculate(:count, :all)
    else
      0
    end
  end
end
