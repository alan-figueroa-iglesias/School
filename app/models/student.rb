class Student < ApplicationRecord
    validates_uniqueness_of :account
    validates_uniqueness_of :email
    has_secure_password

    #validates :photo, presence: true 
    validates :name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true 
    #validates :password, presence: true
    validates :account, presence: true, length: { is: 8 }
    validates :grade, presence: true
    #validates :group, presence: true
end
  