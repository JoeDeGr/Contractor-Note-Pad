require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is a User" do
    user = User.new(name: "Johny Gongetsum", email: "Johnny@Johnny.com", password: "Johnny")
    expect(user.valid?).to eq(true)
    expect(user.name).to eq("Johny Gongetsum")
    expect(user.email).to eq("Johnny@Johnny.com")
    
  end
end
