class PunchList < ApplicationRecord
    belongs_to :project
    has_many :tasks
    has_many :materials, through: :tasks
    has_many :workers, through: :tasks
    validates :name, presence: true
    # validates :name, uniqueness: true
    validates :project_id, presence: true

    def materials_total
        total = 0
        self.tasks.each do |t|
            total += t.materials_total.split("$")[1].split(".").join.to_i
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
end
