class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :title, :description, :user_id, presence:true
  validates :price, presence:true, numericality:true, format: { with: /\A\d{1,4}(\.\d{0,2})?\z/ }

  def average_rating
  	self.reviews.inject{|sum,x| sum.rating + x.rating } / self.reviews.count.to_f
  end
end
