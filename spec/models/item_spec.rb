require 'rails_helper'

RSpec.describe Item, type: :model do
    describe 'relationships' do
    it { should have_many(:customer_items) }
    it { should have_many(:customers).through(:customer_items) }
    end

    describe 'model methods' do
        it "can use the total cost method" do
            safeway = Supermarket.create!(name: "Safeway", location: "Downtown")
            skittles = Item.create!(name: "Skittles", price: 2)
            grapes = Item.create!(name: "Grapes", price: 4)
            lego = Item.create!(name: "Lego", price: 12)
            nick = safeway.customers.create!(name: "Nick")

            customer_item_1 = CustomerItem.create!(customer_id: nick.id, item_id: skittles.id)
            customer_item_2 = CustomerItem.create!(customer_id: nick.id, item_id: grapes.id)

            expect(nick.items.total_cost).to eq(6)
        end
    end
end