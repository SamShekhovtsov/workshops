class Processingitem < ActiveRecord::Base
  validates :item_type, :item_id, presence:true
end