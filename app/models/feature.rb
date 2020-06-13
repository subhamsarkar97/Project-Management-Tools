class Feature < ApplicationRecord
    include PublicActivity::Model
    tracked
    
    has_secure_token :identity_token
    belongs_to :user
    validates :title, presence: true, length: { maximum: 255 }
    validates :description, presence: true, length: { maximum: 1000 }
    has_many :comments
    mount_uploader :picture, PictureUploader
    has_many :jobs, dependent: :destroy
    accepts_nested_attributes_for :jobs, allow_destroy: true
    INITIAL_LIST = ["Started"]
    STATUS_LIST = ["Started", "Finished", "Delivered"]
    PANEL_LIST = ["Current_itteration", "Backlog", "Icebox"]
    EMAIL_LIST = []
    email_array = User.all.map { |user| user.username }
    email_array.each do |f|
        EMAIL_LIST.push(f)
    end    
end
