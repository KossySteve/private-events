class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :description
      t.date :date
      t.integer :user_id
      t.timestamps
    end
  end
end
