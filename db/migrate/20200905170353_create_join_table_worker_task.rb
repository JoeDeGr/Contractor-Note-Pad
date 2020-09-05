class CreateJoinTableWorkerTask < ActiveRecord::Migration[6.0]
  def change
    create_join_table :workers, :tasks do |t|
      # t.index [:worker_id, :task_id]
      # t.index [:task_id, :worker_id]
    end
    create_table :worker_tasks do |t|
      t.integer :worker_id
      t.integer :task_id
    end
  end
  
end


