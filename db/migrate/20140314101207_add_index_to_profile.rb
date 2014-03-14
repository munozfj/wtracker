class AddIndexToProfile < ActiveRecord::Migration
  def change
    change_column(:profiles,:activity_level,:string,default: 1)
    add_index(:profiles,:user_id,unique: false, name: 'usr_fk_idx')
  end
end
