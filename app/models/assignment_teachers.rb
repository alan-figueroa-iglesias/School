class AssignmentTeachers < ApplicationRecord
    belongs_to :teacher
    belongs_to :assignment

    validates :group, presence: true

end