class Item < ApplicationRecord
    has_many :customer_items
    has_many :customers, through: :customer_items

    def self.total_cost 
        sum(:price)
    end
end