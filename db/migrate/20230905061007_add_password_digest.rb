class AddPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :password_digest, :string
    add_column :students, :password_digest, :string
    add_column :teachers, :password_digest, :string
  end
end
