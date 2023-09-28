class CreateAssignmentTeacher < ActiveRecord::Migration[5.2]
  def change
    create_table :assignment_teachers do |t|
      t.belongs_to :assignment
      t.belongs_to :teacher
      t.integer :grade, limit: 1
      t.string :group

      t.timestamps
    end
  end
end
