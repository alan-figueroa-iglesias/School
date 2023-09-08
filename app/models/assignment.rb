class Assignment < ApplicationRecord
    validates :name, presence: true
    validates :grade, presence: true,  length: { is: 1 }
    validates :group, presence: true 
end
