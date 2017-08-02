class AddAdvantageToProject < ActiveRecord::Migration[5.0]
  def change
      add_column :projects, :advantage, :text
  end
end
