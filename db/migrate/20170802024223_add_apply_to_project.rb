class AddApplyToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :apply,:text
  end
end
