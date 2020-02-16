class CategoryService < ApplicationRecord
  belongs_to :service
  belongs_to :category
  accepts_nested_attributes_for :category
end
