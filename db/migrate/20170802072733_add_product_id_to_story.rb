class AddProductIdToStory < ActiveRecord::Migration[5.0]
  def change
    add_column :stories,:product_id,:integer
  end
end
