class PunchList < ApplicationRecord
    belongs_to :project
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :project_id, presence: true
end
