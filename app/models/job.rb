class Job < ApplicationRecord
    belongs_to :feature, optional: true
        
end
