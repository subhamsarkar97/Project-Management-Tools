class Comment < ApplicationRecord
    belongs_to :feature
    belongs_to :user 
    validates :comment, presence: true, length: { maximum: 255 }
end
