class PunchList < ApplicationRecord
    belongs_to :project
    has_many :tasks
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :project_id, presence: true
end
