class AddUserIdToCompanyprofiles < ActiveRecord::Migration[5.0]
  def change
    add_column :Companyprofiles,:user_id,:integer
  end
end
