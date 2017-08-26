class AddObserveToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :observe,:text
  end
end
