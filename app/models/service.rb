class Service < ApplicationRecord
    has_many :galleries
    has_many :category_services#, inverse_of: :service
    has_many :categories, through:  :category_services
    has_many :offers
    belongs_to :user
    accepts_nested_attributes_for :galleries, update_only: true, reject_if: :existed_galleries, limit: 7
    accepts_nested_attributes_for :category_services, update_only: true, reject_if: :existed_category_services, limit: 5

    private
        def existed_galleries attributes
            self.galleries.where(url: attributes['url']).exists?
        end

        def existed_category_services attributes
            self.category_services.where(category_id: attributes['category_id']).exists?
        end
    
end
