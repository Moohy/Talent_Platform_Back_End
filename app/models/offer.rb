class Offer < ApplicationRecord
    has_many :payments
    belongs_to :user
    belongs_to :service
end
