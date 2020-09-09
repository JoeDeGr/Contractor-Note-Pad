# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = User.create(name: "Bob", email: "bob@bob.com", password: "password")

@project = Project.create(name: "Bobs Big Deal", user: @user)

@punchlist = PunchList.create(name: "Bobs List", project: @project)

@task = Task.create(name: "Do this thing, Bob!", punch_list: @punchlist)

@worker = Worker.create(name: "Bob", user_id: @user.id)
