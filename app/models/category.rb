class Category < ActiveRecord::Base
  has_many :products

  validates :name, presence:true, uniqueness: true, length: { maximum: 50,
    too_long: "%{count} characters is the maximum allowed for category name" }
end
