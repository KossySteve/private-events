class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :description
      t.belongs_to :creator, foreign_key: { to_table: :users }
      
      t.timestamps
    end
  end
end