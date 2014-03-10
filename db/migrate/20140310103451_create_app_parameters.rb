class CreateAppParameters < ActiveRecord::Migration
  def change
    create_table :app_parameters do |t|
      t.string :group
      t.string :code
      t.string :value
      t.string :description

      t.timestamps
    end
  end
end
