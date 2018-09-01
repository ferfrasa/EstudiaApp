class University < ApplicationRecord
    
    has_many :teachers
    has_many :students
    accepts_nested_attributes_for :teachers
    #accepts_nested_attributes_for :students
end
