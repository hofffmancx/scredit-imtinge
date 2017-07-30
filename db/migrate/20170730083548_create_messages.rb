class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :name
      t.text :description
      t.string :telphone
      t.string :email

      t.timestamps
    end
  end
end
