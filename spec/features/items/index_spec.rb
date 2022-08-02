require 'rails_helper'

RSpec.describe "Supermarket Items Index Page" do
    it "shows a unique list of all the items the supermarket has" do
        safeway = Supermarket.create!(name: "Safeway", location: "Downtown")
        city_market= Supermarket.create!(name: "City Market", location: "Country")
        skittles = Item.create!(name: "Skittles", price: 2)
        grapes = Item.create!(name: "Grapes", price: 4)
        lego = Item.create!(name: "Lego", price: 12) 
        medicine = Item.create!(name: "Bourbon", price: 18) 


        nick = safeway.customers.create!(name: "Nick")
        john = safeway.customers.create!(name: "John")
        bert = city_market.customers.create!(name: "Bert")

        customer_item_1 = CustomerItem.create!(customer_id: nick.id, item_id: skittles.id)
        customer_item_2 = CustomerItem.create!(customer_id: nick.id, item_id: grapes.id)
        customer_item_3 = CustomerItem.create!(customer_id: john.id, item_id: grapes.id)
        customer_item_4 = CustomerItem.create!(customer_id: bert.id, item_id: medicine.id)


        visit "/supermarkets/#{safeway.id}/items"
        
        expect(current_path).to eq("/supermarkets/#{safeway.id}/items")
        expect(page).to have_content("Skittles")
        expect(page).to have_content("Grapes")
        expect(page).to_not have_content("Bourbon")
    end


end

# Story 3 of 3
# As a visitor,
# When I visit a supermarket show page,
# I see the name of that supermarket,
# And I see a link to view all of the items that the supermarket has
# And when I click on the link,
# I am taken to the supermarkets item index page,
# And I can see a UNIQUE list of all the items that the supermarket has