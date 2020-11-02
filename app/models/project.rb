class Project < ApplicationRecord
    validates :name, presence: true
    validates_uniqueness_of :name, scope: :user_id
    belongs_to :user
    has_many :punch_lists
    has_many :tasks, through: :punch_lists
    has_many :materials, through: :tasks
    scope :complete, -> { where(completed: true) }

    def materials_total
        total = 0
        self.punch_lists.each do |l|
            total += l.materials_total.split("$")[1].split(".").join.to_i
        end
        "$#{total.to_s[0..-3]}.#{total.to_s.last(2)}" 
    end
end
