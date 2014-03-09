class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.integer :user_id
      t.date    :date       , null: false, default: Time.now
      t.float   :weight     , null: false, precision: 5, scale: 2
      t.float   :fat_porcentage , precision: 5, scale: 2

      t.timestamps
    end
  end
end
