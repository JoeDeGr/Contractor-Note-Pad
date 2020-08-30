require 'rails_helper'

RSpec.feature "Feature Test", type: :feature do
  # pending "add some scenarios (or delete) #{__FILE__}"
  it "has a login page" do
    visit "/"
    expect(page).to have_content("Welcome!")
  end

  it "has links to signup and login" do
    visit "/"
    click_link("Sign Up")
    expect(current_path).to eq('/users/new')
    visit "/"
    click_link("Log In")
    expect(current_path).to eq('/sessions/new')
  end
end
