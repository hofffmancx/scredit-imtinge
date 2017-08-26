class CreateEliteteams < ActiveRecord::Migration[5.0]
  def change
    create_table :eliteteams do |t|
      t.text :description

      t.timestamps
    end
  end
end
