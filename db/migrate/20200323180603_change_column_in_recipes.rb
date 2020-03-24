class ChangeColumnInRecipes < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :email, :description
    change_column :recipes, :description, :text
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
