# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = User.create(name: "Bob", email: "bob@bob.com", password: "password")
@project = Project.create(name: "Joes Big Deal", user: @user)
@punchlist = PunchList.create(name: "Bobs List", project: @project)
@task = Task.create(name: "Do this thing, Bob!", punch_list: @punchlist)
@worker = Worker.create(name: "Bob", user_id: @user.id)

@user2 = User.create(name: "Joe", email: "Joe@Joe.com", password: "password")
@project2 = Project.create(name: "Joes Big Deal", user: @user2)
@punchlist2 = PunchList.create(name: "Joes List", project: @project2)

@task2 = Task.create(name: "Do this thing", punch_list: @punchlist2, description: "Go to this place, and do the things and stuff.")
@task3 = Task.create(name: "This Needs Doing", punch_list: @punchlist2, description: "Go to the nect place and do the things.")
@task4 = Task.create(name: "DON'T FORGET THIS!", punch_list: @punchlist2, description: "DON'T FORGET TO PICK UP THE MILK AND EGGS!")

@worker2 = Worker.create(name: "Jim", user_id: @user2.id)
@worker3 = Worker.create(name: "Mike", user_id: @user2.id)
@worker4 = Worker.create(name: "Skeeve", user_id: @user2.id)

@worker.tasks << @task
@worker.save

@worker2.tasks << @task2
@worker2.tasks << @task3
@worker2.tasks << @task4
@worker2.save

@worker3.tasks << @task3
@worker3.save

@worker4.tasks << @task2
@worker4.tasks << @task4
@worker4.save

@materials = Material.create(name: "Things", price: "$101.76", date: Time.now, description: "Things for the stuff.", task_id: 1)
@materials2 = Material.create(name: "More things", price: "$241.41", date: Time.now, description: "for the stuff.", task_id: 2)
@materials3 = Material.create(name: "Other things.", price: "$1976", date: Time.now, description: "windows.", task_id: 3)
@materials4 = Material.create(name: "OOOO... These things.", price: "$.43", date: Time.now, description: "the blue one.", task_id: 1)
@materials5 = Material.create(name: "Some things for the stuff", price: "$100.", date: Time.now, description: "I found this at a tag sale.", task_id: 4)
@materials6 = Material.create(name: "Shoes.", price: "$22020.", date: Time.now, description: "SHOES!.", task_id: 1)


