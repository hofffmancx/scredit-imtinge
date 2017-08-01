class CreateActivityReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_reviews do |t|
      t.text :comment
      t.string :activity_id
      t.string :integer
      t.integer :user_id

      t.timestamps
    end
  end
end
