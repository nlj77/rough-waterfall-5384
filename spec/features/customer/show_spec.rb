require 'rails_helper'

RSpec.describe "Customer Show Page" do
    it "lists all a customer's items and the name of the supermarket it belongs to" do
        safeway = Supermarket.create!(name: "Safeway", location: "Downtown")
        skittles = Item.create!(name: "Skittles", price: 2)
        grapes = Item.create!(name: "Grapes", price: 4)
        lego = Item.create!(name: "Lego", price: 12)
        nick = safeway.customers.create!(name: "Nick")

        customer_item_1 = CustomerItem.create!(customer_id: nick.id, item_id: skittles.id)
        customer_item_2 = CustomerItem.create!(customer_id: nick.id, item_id: grapes.id)

        visit "/customers/#{nick.id}"
        expect(page).to have_content(nick.name)
        expect(page).to have_content("Skittles $2.00")
        expect(page).to have_content("Grapes $4.00")
        expect(page).to have_no_content("Lego $12.00")
    end

    it "shows a total price of all items on a customer's show page" do 
        safeway = Supermarket.create!(name: "Safeway", location: "Downtown")
        skittles = Item.create!(name: "Skittles", price: 2)
        grapes = Item.create!(name: "Grapes", price: 4)
        lego = Item.create!(name: "Lego", price: 12)
        nick = safeway.customers.create!(name: "Nick")

        customer_item_1 = CustomerItem.create!(customer_id: nick.id, item_id: skittles.id)
        customer_item_2 = CustomerItem.create!(customer_id: nick.id, item_id: grapes.id)

        visit "/customers/#{nick.id}"
        expect(nick.items.total_cost).to eq(6)

    end

end