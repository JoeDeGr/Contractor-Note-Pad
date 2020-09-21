class Task < ApplicationRecord
    validates :name, presence: true
    belongs_to :punch_list
    has_many :materials
    has_many :worker_tasks
    has_many :workers, through: :worker_tasks

    def materials_total
        total = 0
        self.materials.each do |m|
            total += m.price.to_i
        end
        "$#{total.to_s[0..-3]}.#{total.to_s.last(2)}" 
    end

    def uniq_workers
        self.workers.uniq
    end

    def workers_list
        workers = []
        self.uniq_workers.each do |worker|
            workers << worker.name
        end
        workers.join(", ")
    end

    def user
        self.punch_list.project.user
    end

    def available_workers
        workers = []
        self.user.workers.each do |w|
            workers << w
        end
    end
end
