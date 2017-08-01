class AddIsHiddenToActivity < ActiveRecord::Migration[5.0]
  def change
     add_column :activities, :is_hidden, :boolean, default: true
  end
end
