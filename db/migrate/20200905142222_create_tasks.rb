class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :completed, default: false
      t.string :date_completed
      t.string :hours_to_complete
      t.integer :punch_list_id
 
      t.timestamps
    end
  end
end
