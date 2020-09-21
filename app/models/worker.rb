class Worker < ApplicationRecord
    belongs_to :user
    has_many :worker_tasks
    has_many :tasks, through: :worker_tasks

    def available_tasks
        tasks = []
        self.user.tasks.each do |t|
            tasks << t
        end
    end
end
