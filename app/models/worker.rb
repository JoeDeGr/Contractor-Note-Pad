class Worker < ApplicationRecord
    belongs_to :user
    has_many :tasks_workers
    has_many :tasks, through: :tasks_workers
end
