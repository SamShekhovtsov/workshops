class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :title, :description, presence:true
  validates :price, presence:true, numericality: { only_integer: true }
end
