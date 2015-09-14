class Book < ActiveRecord::Base
  validates :title, :price, :amount, presence: true

  belongs_to              :author
  has_many                :ratings
  has_many                :order_items
  has_and_belongs_to_many :categories

  scope :top_sellers, lambda {
    select('*').
    joins('INNER JOIN order_items ON order_items.book_id = books.id').
    order('order_items.quantity DESC').
    limit(5)
  }
  
  mount_uploader :cover, CoverUploader

  def count_average_rate
    if ratings.calculate(:count, :all) != 0
      ratings.sum(:rate)/ratings.calculate(:count, :all)
    else
      0
    end
  end

  def self.search(search)
    if search
      self.where('title = ?', search)
    else
      self.all
    end
  end

end
