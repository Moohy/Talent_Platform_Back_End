class Category < ApplicationRecord
    has_many :category_services
    has_many :services, through:  :category_services
end
