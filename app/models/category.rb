class Category < ApplicationRecord
    has_many :categories_services
    has_many :services, through:  :categories_services
end
