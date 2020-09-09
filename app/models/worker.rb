class Worker < ApplicationRecord
    belongs_to :user
    has_many :worker_tasks
    has_many :tasks, through: :worker_tasks
end
