class CategoryService < ApplicationRecord
  belongs_to :service
  belongs_to :category
end
