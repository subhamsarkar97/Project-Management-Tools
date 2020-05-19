class Feature < ApplicationRecord
    belongs_to :user
    mount_uploader :picture, PictureUploader
    has_many :jobs, dependent: :destroy
    accepts_nested_attributes_for :jobs, allow_destroy: true
    INITIAL_LIST = ["Started"]
    STATUS_LIST = ["Started", "Finished", "Delivered"]
    def self.search(search)
        if search    
            where(["title LIKE ?","%#{search}%"])
        else
            flash.now[:notice] = "Please Write Something"
        end
    end  
end
