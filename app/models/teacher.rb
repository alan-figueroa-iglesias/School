class Teacher < ApplicationRecord
    has_secure_password
    #validates :photo, presence: true 
    validates :name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true 
    #validates :password, presence: true
    validates :account, presence: true, length: { is: 8 }
end
