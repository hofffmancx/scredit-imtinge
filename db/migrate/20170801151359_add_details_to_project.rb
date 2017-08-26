class AddDetailsToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :details, :text
  end
end
