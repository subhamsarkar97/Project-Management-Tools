class Feature < ApplicationRecord
    has_secure_token :identity_token
    belongs_to :user
    has_many :comments
    mount_uploader :picture, PictureUploader
    has_many :jobs, dependent: :destroy
    accepts_nested_attributes_for :jobs, allow_destroy: true
    INITIAL_LIST = ["Started"]
    STATUS_LIST = ["Started", "Finished", "Delivered"]
end
