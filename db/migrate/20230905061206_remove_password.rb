class RemovePassword < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :password, :string
    remove_column :students, :password, :string
    remove_column :teachers, :password, :string
  end
end
