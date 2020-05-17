class Feature < ApplicationRecord
    belongs_to :user
    belongs_to :project
    mount_uploader :picture, PictureUploader
    has_many :jobs, dependent: :destroy
    accepts_nested_attributes_for :jobs, allow_destroy: true
    INITIAL_LIST = ["Started"]
    STATUS_LIST = ["Started", "Finished", "Delivered"]
    def self.search(search)
        if search    
            where(["title LIKE ?","%#{search}%"])
        else
            all
        end
    end  

    
end
