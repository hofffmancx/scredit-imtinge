class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string   "image"
      t.string   "title"
      t.text     "description"
      t.integer  "user_id"
      t.text     "summary"
      t.boolean  "is_hidden",   default: true

      t.timestamps
    end
  end
end
