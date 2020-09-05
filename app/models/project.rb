class Project < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true
    belongs_to :user
    has_many :punch_lists
    has_many :tasks, through: :punch_lists
end
