class CreatePunchLists < ActiveRecord::Migration[6.0]
  def change
    create_table :punch_lists do |t|
      t.string :name
      t.string :date_time_completed
      t.boolean :completed
      t.string :materials
      t.string :hours_to_complete

      t.timestamps
    end
  end
end
