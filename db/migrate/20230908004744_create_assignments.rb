class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :name
      t.integer :grade, limit: 1
      t.string :group

      t.timestamps
    end
  end
end
