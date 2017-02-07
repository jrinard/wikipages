require 'rails_helper'

describe "the add a Type process" do
  it "adds a new list" do
    visit types_path
    click_link 'New Type'
    fill_in 'Category', :with => 'Home stuff'
    click_on 'Create Type'
    expect(page).to have_content 'Home stuff'
  end

  it "gives error when no name is entered" do
    visit new_type_path
    click_on 'Create Type'
    expect(page).to have_content 'errors'
  end
  it "gives error when no name is entered" do
    type = Type.create(:category => 'Home stuff')
    visit types_path
    click_link 'New Type'
    fill_in 'Category', :with => ''
    click_on 'Create Type'
    expect(page).to have_content 'errors'
  end
end

describe "the edit a Listing process" do
  it "edits a listing" do
    type = Type.create(:category => 'Home stuff')
    listing = Listing.create(:name => 'Wash the dishes', :type_id => type.id)
    visit type_path(type)
    click_on 'Edit'
    fill_in 'Name', :with => 'Wash the dog'
    click_on 'Update Listing'
    expect(page).to have_content 'Wash the dog'
  end
end
