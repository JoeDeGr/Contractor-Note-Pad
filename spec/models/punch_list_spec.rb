require 'rails_helper'

RSpec.describe PunchList, type: :model do
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

  let(:punch_list){
    PunchList.create(
      :name => "New Punch List",
      :project_id => project.id
    )
  }
  it "belongs to one project" do
    expect(punch_list.project).to eq(project)
  end
end
