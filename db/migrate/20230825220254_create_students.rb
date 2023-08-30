class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :photo
      t.string :name
      t.string :last_name
      t.string :email
      t.string :password
      t.integer :account, limit: 8
      t.string :group, limit: 1
      t.integer :grade, limit: 1

      t.timestamps
    end
  end
end
