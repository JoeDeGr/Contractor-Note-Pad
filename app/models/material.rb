class Material < ApplicationRecord
    belongs_to :task

    def material_price_parse
        if self.price.include?("$")
            self.price.split("$")[1].split(".").join
        else
            self.price.split(".").join
        end
    end

    def price_return
        total = 0
        "$#{self.price.to_s[0..-3]}.#{self.price.to_s.last(2)}" 
    end

    def user
        self.task.user
    end
end
