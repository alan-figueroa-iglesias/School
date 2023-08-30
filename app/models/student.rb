class Student < ApplicationRecord
    #validates :photo, presence: true 
    validates :name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true 
    #validates :password, presence: true
    validates :account, presence: true
    validates :group, presence: true
    validates :grade, presence: true    
  end
  