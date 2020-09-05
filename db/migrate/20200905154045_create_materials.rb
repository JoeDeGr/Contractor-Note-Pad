class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :description
      t.string :price
      t.string :date
      t.integer :task_id

      t.timestamps
    end
  end
end
