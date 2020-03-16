class Payment < ApplicationRecord
    belongs_to :offer 
    belongs_to :user
    has_one_attached :receipt
end
