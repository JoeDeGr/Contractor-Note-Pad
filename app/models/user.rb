class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true
    # validates :email, confirmation: true
    validates :email, uniqueness: true
    # validates :email_confirmation, presence: true
    validates :password, presence: true
    # validates :password, confirmation: true
    # validates :password_confirmation, presence: true

end
