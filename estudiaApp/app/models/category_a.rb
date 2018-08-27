class CategoryA < ApplicationRecord
    validates :name , presence: true
    has_many :has_category_as
    has_many :articles, through: :has_category_as
end
