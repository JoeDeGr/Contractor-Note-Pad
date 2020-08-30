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
  end

end
