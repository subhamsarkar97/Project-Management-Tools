class Comment < ApplicationRecord
    include PublicActivity::Model
    tracked
    
    has_rich_text :body

    belongs_to :feature
    validates :body, presence: true, length: { maximum: 255 }
end
