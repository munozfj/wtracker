class ModifyColumnsToProfile < ActiveRecord::Migration
  def up
    remove_column(:profiles,:email)
    rename_column(:profiles,:activity_type,:activity_level)
  end

  def down
    rename_column(:profiles,:activity_level,:activity_type)
    add_column(:profiles,:email,:string)
  end
end
