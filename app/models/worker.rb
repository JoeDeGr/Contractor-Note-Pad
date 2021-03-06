class Worker < ApplicationRecord
    belongs_to :user
    validates :name, presence: true
    has_many :worker_tasks
    has_many :tasks, through: :worker_tasks

    def available_tasks
        tasks = []
        self.user.tasks.each do |t|
            if !self.tasks.include?(t)
                tasks << t
            end
        end
        tasks
    end
end
