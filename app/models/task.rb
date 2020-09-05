class Task < ApplicationRecord
    belongs_to :punch_list
    has_many :materials
end
