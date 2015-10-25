class CreateProcessingitems < ActiveRecord::Migration
  def change
  	create_table :processingitems do |t|
	    t.string :item_type
	    t.integer :item_id
    end
  end
end
