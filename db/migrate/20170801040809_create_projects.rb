class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
     t.text :content
     t.integer :product_id
     t.integer :user_id

      t.timestamps
    end
  end
end
