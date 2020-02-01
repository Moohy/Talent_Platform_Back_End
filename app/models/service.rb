class Service < ApplicationRecord
    has_many :galleries
    has_many :category_services
    has_many :categories, through:  :category_services
    has_many :offers
    belongs_to :user
end
