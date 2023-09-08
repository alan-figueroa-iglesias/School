class ChangeGroupAssignment < ActiveRecord::Migration[5.2]
  def change
    change_column :assignments, :group, :string, limit: 1
    change_column :assignments, :group, :string
  end
end
