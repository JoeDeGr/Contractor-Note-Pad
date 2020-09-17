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
      :name => "#{@project.name}'s new Punch List",
      :project_id => @project.id
    )

    @task = Task.create(
      :name => "#{@punch_list}'s new Task",
      :punch_list_id => @punch_list.id,
      :description => "It's super cool that we can have a super cool description for this task!"
    )

    @material = Material.create(
      :name => "#{@task}'s new Material",
      :description => "Thes Materials sweet description",
      :price => "10001",
      :task_id => @task.id,
      :date => Time.now
    )

    @worker = Worker.create(
      :name => "John Doeslittle",
      :user_id => @user.id
    )
    @worker.tasks << @task
    @worker.save
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

  it "shows the Projects PunchList items on the /projects/show page as a functioning link" do
    visit("/projects/#{@project.id}")
    expect(page).to have_content("#{@project.punch_lists.first.name}")
    click_link(@punch_list.name)
    expect(current_path).to eq("/punch_lists/#{@punch_list.id}")
  end

  it "shows a Punch Lists Tasks" do
    visit("/punch_lists/#{@punch_list.id}")
    expect(page).to have_content("#{@user.name}")
    expect(page).to have_content("#{@project.name}")
    expect(page).to have_content("#{@punch_list.name}")
    expect(page).to have_content("#{@punch_list.tasks.first.name}")
end

  it "has a Task Page that shows the user, project, punch list, materials, workers, and hours" do
    visit("/tasks/#{@task.id}")
    expect(page).to have_content("#{@user.name}")
    expect(page).to have_content("#{@project.name}")
    expect(page).to have_content("#{@punch_list.name}")
    expect(page).to have_content("#{@task.name}")
    expect(page).to have_content("#{@task.description}")
    expect(page).to have_content("#{@material.name}")
    expect(page).to have_content("#{@worker.name}")
  end

  it "shows aggrigated materials on the punch_List show page" do
    visit("/punch_lists/#{@punch_list.id}")
    expect(page).to have_content(@punch_list.materials_total)
  end 

  it "shows aggrigated materials on the project show page" do
    visit("/projects/#{@project.id}")
    expect(page).to have_content(@project.materials_total)
  end

  it "allows the user to build a worker" do
    visit("/users/#{@user.id}")
    # click_link("Create a New Worker")
    fill_in("worker[name]", :with => "Georgy Dosumtin")
    click_button("Create a New Worker")
    expect(current_path).to eq("/workers/#{Worker.last.id}")
    click_link("Home Page")
    expect(page).to have_content("Georgy Dosumtin")
  end

  it "shows the Workers, Project Materials total and PunchList Total Materials cost on the Project Show Page " do
    visit("/projects/#{@project.id}")
    expect(page).to have_content(@project.materials_total)
    expect(page).to have_content(@punch_list.workers.first.name)
    expect(page).to have_content(@punch_list.materials_total)
  end

  it "shows The PunchList total materials, workers for each Task, and Task Materials Total on PunchList Show Page" do
    visit("/punch_lists/#{@punch_list.id}")
    expect(page).to have_content(@punch_list.materials_total)
    expect(page).to have_content(@task.materials_total)
    expect(page).to have_content(@task.workers_list)
  end
end
