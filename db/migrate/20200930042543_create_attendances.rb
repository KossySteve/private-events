class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.integer :event_id
      t.integer :user_id
    end
  end
end
