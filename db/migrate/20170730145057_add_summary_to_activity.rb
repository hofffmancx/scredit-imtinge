class AddSummaryToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :summary, :text
  end
end
