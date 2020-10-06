class AddPresentToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :name, :string
  end
end
