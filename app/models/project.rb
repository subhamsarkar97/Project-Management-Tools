class Project < ApplicationRecord
    belongs_to :user
    validates :projectname, presence: true, length: { maximum: 255 }
end
