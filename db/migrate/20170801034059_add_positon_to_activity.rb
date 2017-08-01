class AddPositonToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :position, :integer

   Activity.order(:updated_at).each.with_index(1) do |activity, index|
      activity.update_column :position, index
   end
  end
end
