class RemoveColumnPictureFromUsers < ActiveRecord::Migration[6.0]
    def change
        remove_column :users, :picture, :string
    end
end
