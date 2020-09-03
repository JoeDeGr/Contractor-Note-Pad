class Project < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true
    belongs_to :user
    has_many :punch_lists
end
