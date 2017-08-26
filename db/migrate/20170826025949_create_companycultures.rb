class CreateCompanycultures < ActiveRecord::Migration[5.0]
  def change
    create_table :companycultures do |t|
      t.text :description

      t.timestamps
    end
  end
end
