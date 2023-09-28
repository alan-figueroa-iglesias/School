class Teacher < ApplicationRecord
    validates_uniqueness_of :account
    validates_uniqueness_of :email
    has_secure_password

    has_many :assignment_teachers, class_name: "AssignmentTeachers" 
    has_many :assignments, through: :assignment_teachers

    #validates :photo, presence: true 
    validates :name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true 
    #validates :password, presence: true
    validates :account, presence: true, length: { is: 8 }
end
