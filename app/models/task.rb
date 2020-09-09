class Task < ApplicationRecord
    belongs_to :punch_list
    has_many :materials
    has_many :worker_tasks
    has_many :workers, through: :worker_tasks
end
