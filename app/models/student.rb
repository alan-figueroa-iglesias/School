class Student < ApplicationRecord
    has_secure_password
    #validates :photo, presence: true 
    validates :name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true 
    #validates :password, presence: true
    validates :account, presence: true, length: { is: 8 }
    validates :group, presence: true, length: { is: 1 }
    validates :grade, presence: true, length: { is: 1 }
end
  