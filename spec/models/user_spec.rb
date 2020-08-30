require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is a User" do
    user = User.create(name: "New User")
    expect(user.name).to eq("New User")
  end
end
