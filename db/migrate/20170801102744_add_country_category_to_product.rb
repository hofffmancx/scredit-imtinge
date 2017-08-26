class AddCountryCategoryToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products,:country_category_id,:integer
  end
end
