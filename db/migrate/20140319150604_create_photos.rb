class CreatePhotos < ActiveRecord::Migration
  def up
    create_table :photos do |t|
      t.integer :user_id
      t.date :date
      t.text :comment
      t.timestamps
    end

    add_attachment :photos, :picture
    
    add_index(:photos,:user_id,unique: false, name: 'photo_usr_fk_idx')
  end

  def down
    drop_table :photos
  end
end
