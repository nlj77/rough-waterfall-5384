require 'rails_helper'

RSpec.describe "Supermarket Show Page" do

    it "shows the name of the supermarket" do
        safeway = Supermarket.create!(name: "Safeway", location: "Downtown")

        visit "supermarkets/#{safeway.id}"

        expect(page).to have_content("Safeway")
        expect(page).to have_content("Location: Downtown")
    end

    it "shows a link to view all of the items that the supermarket has" do
        safeway = Supermarket.create!(name: "Safeway", location: "Downtown")

        visit "supermarkets/#{safeway.id}"

        expect(page).to have_content("Safeway's Item Index Page")

        click_link("Safeway's Item Index Page")

        expect(current_path).to eq("/supermarkets/#{safeway.id}/items")
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