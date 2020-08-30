class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :completed, default: false
      t.string :date_time_completed
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
