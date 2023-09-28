class Assignment < ApplicationRecord
    has_many :assignment_teachers, class_name: "AssignmentTeachers" 
    has_many :teachers, through: :assignment_teachers
    validates_uniqueness_of :name
    validates :name, presence: true
end
