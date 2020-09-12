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

  let(:project) {
    Project.create(
      :name => "New Project",
      :user_id => user.id
    )
  }

  let(:worker) {
    Worker.create(
      :name => "John Doeslittle",
      :user_id => user.id
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

  it "has a button to create a New Project and it to be linked to the user" do
    visit("/users/#{user.id}")
    fill_in("project[name]", :with => "The Diggity Doghouse")
    click_button('Create a New Project')
    expect(current_path).to eq("/projects/2")
    click_link("Home Page")
    expect(page).to have_content(user.name)
    expect(page).to have_content("The Diggity Doghouse")
  end

  # it "has a list of workers" do
  #   visit("/users/#{user.id}")
  #   expect(page).to have_content("John Doeslittle")
  # end

  it "allows a User to create a worker" do
    visit("/users/#{user.id}")
    fill_in("worker[name]", :with => "Jack Hammer")
    click_button("Create a New Worker")
    expect(page).to have_content("Jack Hammer")
  end
     
end
