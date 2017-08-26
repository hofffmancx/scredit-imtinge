class CreateCompanyprofiles < ActiveRecord::Migration[5.0]
  def change
    create_table :companyprofiles do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
