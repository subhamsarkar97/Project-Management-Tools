class User < ApplicationRecord
    has_secure_password
    has_many :projects, dependent: :destroy
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :username, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { minimum: 3 }
end
