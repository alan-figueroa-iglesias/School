class AddGradeGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :grade, :integer, limit: 1
    add_column :assignments, :group, :string, limit: 1
  end
end
