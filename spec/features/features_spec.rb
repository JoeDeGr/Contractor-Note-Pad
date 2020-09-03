require_relative "../rails_helper.rb"

RSpec.feature "Feature Test", type: :feature do
  # pending "add some scenarios (or delete) #{__FILE__}"
  before(:all) do
    @user = User.create(
      :name => "Jimmy Bones",
      :email => "Jimmy@bones.com",
      :password => "Jimmy",
      :password_confirmation => "Jimmy",
    )

    @project = Project.create(
      :name => "Jimmy's Jam",
      :user_id => @user.id
    )

    @punch_list =PunchList.create(
      :name => "#{@project.name}'s New Punch List",
      :project_id => @project.id
    )
  end
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

  it "sucessfully creates a user" do
    visit '/users/new'
    expect(current_path).to eq('/users/new')
    # user_signup
    fill_in("user[name]", :with => "Joey Bagalodonuts")
    fill_in("user[email]", :with => "Joey@bagalodon.com")
    fill_in("user[password]", :with => "Joey")
    fill_in("user[password_confirmation]", :with => "Joey")
    click_button('Create User')
    expect(current_path).to eq('/users/2')
    expect(page).to have_content("Joey Bagalodon")
  end

  it "Project show page shows Project name" do
    visit("/users/#{@user.id}")
    fill_in("project[name]", :with => "New Project")
    click_button('Create a New Project')
    expect(page).to have_content("New Project")
  end

  it "has a link to the users projects on the users show page" do
    visit("/users/#{@user.id}")
    click_link("#{@project.name}")
    expect(current_path).to eq("/projects/#{@project.id}")
  end

  it "shows the Projects PunchList items on the /projects/show page" do
    visit("/projects/#{@project.id}")
    expect(page).to have_content("#{@project.punch_lists.first.name}")
  end
end
