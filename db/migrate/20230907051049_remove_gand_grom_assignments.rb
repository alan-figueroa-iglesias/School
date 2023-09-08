class RemoveGandGromAssignments < ActiveRecord::Migration[5.2]
  def change
    remove_column :assignments, :grade, :integer
    remove_column :assignments, :group, :string
  end
end
