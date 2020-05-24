class Comment < ApplicationRecord
    belongs_to :feature
    validates :comment, presence: true, length: { maximum: 255 }
end
