require "rails_helper"

RSpec.feature "Product test", :type => :feature do

  # Passing with all valid input
  scenario "create a new product with all valid input" do
    visit "/products/new"

    fill_in "Name", with: "New item"
    fill_in "Price", with: 8000
    fill_in "Stock", with: 100
    fill_in "Description", with: "blah blah" * 2000
    click_button "Create Product"

    current_path.should == products_path
  end

  scenario "name is not present should render new again" do
    visit "/products/new"

    fill_in "Price", with: 8000
    fill_in "Stock", with: 100
    fill_in "Description", with: "blah blah" * 2000
    click_button "Create Product"

    expect(page).to have_text("errors")
  end

  # scenario "name is not present should render new again" do
  #   visit "/admin"
  #   within("//div[@id='product4']") do
  #     click_link('Edit')
  #   end
  #   fill_in "Name", with: "New item"
  #   fill_in "Price", with: 8000
  #   fill_in "Stock", with: 100
  #   fill_in "Description", with: "Tested"
  #   click_button "Save Product"
  #   visit "/admin"

  #   expect(page).to have_text("Description: Tested")
  # end

end
