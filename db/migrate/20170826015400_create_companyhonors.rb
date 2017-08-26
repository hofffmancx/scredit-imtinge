class CreateCompanyhonors < ActiveRecord::Migration[5.0]
  def change
    create_table :companyhonors do |t|
      t.text :description

      t.timestamps
    end
  end
end
