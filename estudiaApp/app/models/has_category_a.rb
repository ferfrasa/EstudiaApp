class HasCategoryA < ApplicationRecord
  belongs_to :article
  belongs_to :category_a
end
