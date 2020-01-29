class Service < ApplicationRecord
    has_many :galleries
    has_many :categories_services
    has_many :categories, through:  :categories_services
end
