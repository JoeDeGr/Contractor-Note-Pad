require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:user) {
    User.create(
      :name =>"Johny Gongetsum", 
      :email => "Johnny@Johnny.com",
      :password => "Johnny"
    )
  }
  it "is a User" do
    expect(user.valid?).to eq(true)
    expect(user.name).to eq("Johny Gongetsum")
    expect(user.email).to eq("Johnny@Johnny.com")
  end

  it "is a User who can signup" do
    visit"/users/new"
    fill_in("user[name]", :with => "Dirk Diggity")
    fill_in("user[email]", :with => "diggity_doggy@dirk.com")
    fill_in("user[password]", :with => "password")
    fill_in("user[password_confirmation]", :with => "password")
    click_button('Create User')
    expect(page).to have_content("Dirk Diggity's Note Pad")
  end

  it "has a button to create a new Note Pad" do
    click_button('Create a New Project')
    expect(current_path).to eq("/projects/new")
  end
end
