class RemovePasswordSentAtFromUsers < ActiveRecord::Migration[6.0]
    def change
        remove_column :users, :password_sent_at, :datetime
    end
end
