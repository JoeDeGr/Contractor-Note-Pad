class Task < ApplicationRecord
    belongs_to :punch_list
    has_many :materials
    has_many :tasks_workers
    has_many :workers, through: :tasks_workers
end
