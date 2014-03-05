class AddIndexOnEmailToUsers < ActiveRecord::Migration
  def change
    add_index(:users, :email, unique: true)
    change_column(:users, :name, :string, limit: 100)
  end
end
