class Task < ApplicationRecord
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
end
