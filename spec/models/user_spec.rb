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
    fill_in("name", :with => "Dirk Diggity")
    fill_in("email", :with => "diggity_doggy@dirk.com")
    fillin_in("password", :with => "password")
    click_button('Create User')
    expect(current_path).to be(user_path(user))
  end

end
