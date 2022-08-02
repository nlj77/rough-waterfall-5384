require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :customers }
  end
  describe 'model methods' do

    it 'can show unique items' do
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


      
    
      expect(safeway.unique_items[0].name).to eq("Skittles")
      expect(safeway.unique_items[1].name).to eq("Grapes")

    end
  end
end