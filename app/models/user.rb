class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, presence: true
    validates :password, confirmation: { case_sensitive: true }

    has_many :projects
    has_many :punch_lists, through: :projects
    has_many :tasks, through: :punch_lists
    has_many :workers

    def self.search_for_task_workers(task_name)
            task = Task.find_by(name: task_name)
            task.workers
    end
end
