class RemoveResetDigestFromUsers < ActiveRecord::Migration[6.0]
    def change
        remove_column :users, :reset_digest, :string
    end
end
