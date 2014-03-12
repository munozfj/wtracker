class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :email
      t.string :gender
      t.date :date_birth
      t.float :height
      t.string :activity_type

      t.timestamps
    end
  end
end
