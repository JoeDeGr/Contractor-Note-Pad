class WorkerTask < ApplicationRecord
    belongs_to :worker
    belongs_to :task
end