class CreateActivityCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_collections do |t|
      t.string :activity_id
      t.string :integer
      t.integer :user_id

      t.timestamps
    end
  end
end
