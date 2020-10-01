class AddPresentToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :present, :boolean
  end
end
