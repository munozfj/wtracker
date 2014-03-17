class AddPositionToAppParameters < ActiveRecord::Migration
  def change
    add_column(:app_parameters, :position, :integer)
    rename_column(:app_parameters, :code, :name )
  end
end
