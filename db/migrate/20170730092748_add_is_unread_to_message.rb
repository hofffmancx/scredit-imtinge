class AddIsUnreadToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :is_unread, :boolean, default: true
  end
end
