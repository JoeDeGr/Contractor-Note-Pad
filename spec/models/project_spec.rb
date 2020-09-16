require 'rails_helper'

RSpec.describe Project, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:user) {
    User.create(
      :name =>"Joey Bagalodon", 
      :email => "Joey@bagalodon.com",
      :password => "Joey"
    )
  }
  let(:project) {
    Project.create(
      :name => "New Project",
      :user_id => user.id
    )
  }
  it "belongs to one User" do
    expect(project.user).to eq(user)
  end
end
