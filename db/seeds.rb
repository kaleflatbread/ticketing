# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Employee.destroy_all
Project.destroy_all
Ticket.destroy_all
EmployeeProject.destroy_all


scott = Employee.create(name: "Michael Scott", title: "Regional Employee", username: "michaelscott")
bluth = Employee.create(name: "Michael Bluth", title: "CEO", username: "michaelbluth", manager_id: nil)
knope = Employee.create(name: "Leslie Knope", title: "City Council", username: "leslieknope", manager_id: nil)
swanson = Employee.create(name: "Ron Swanson", title: "Director", username: "ronswanson", manager_id: nil)
donaghy = Employee.create(name: "Jack Donaghy", title: "GE Vice President of East Coast Television and Microwave Oven Programming", username: "jackdonaghy", manager_id: nil)

april = Employee.create(name: "April Ludgate", title: "Deputy Director of Animal Control", manager_id: swanson.id, username: "aprilludgate")
andy = Employee.create(name: "Andy Dwyer", title: "Shoe Shiner", manager_id: knope.id, username: "andydwyer")
george = Employee.create(name: "George Michael Bluth", title: "Mr. Manager", manager_id: bluth.id, username: "georgemichaelbluth")
gob = Employee.create(name: "Gob Bluth", title: "Magician", manager_id: bluth.id, username: "gobbluth")
liz = Employee.create(name: "Liz Lemon", title: "Head Writer", manager_id: donaghy.id, username: "lizlemon")
tracy = Employee.create(name: "Tracy Jordan", title: "Actor", manager_id: donaghy.id, username: "tracyjordan")
pam = Employee.create(name: "Pam Beasley", title: "Receptionist", manager_id: scott.id, username: "pambeasly")
dwight = Employee.create(name: "Dwight Schrute", title: "Beet Farmer", manager_id: scott.id, username: "dwightscrhute")


pit = Project.create(name: "the pit", description: "fill the pit")
fest = Project.create(name: "harvest festival", description: "hold the harvest festival")
paper = Project.create(name: "sell paper", description: "beat the computer")
infinity = Project.create(name: "Dunder Mifflin Infinity", description: "sell more paper")
house = Project.create(name: "sell houses", description: "sell more houses")
banana = Project.create(name: "banana stand", description: "the money is in the banana stand")
tv = Project.create(name: "tv", description: "make it")

dirt = Ticket.create(project_id: pit.id, name: "dirt", description: "put some dirt in it", employee_id: andy.id)
lilsebastian = Ticket.create(project_id: fest.id, name: "Lil Sebastian", description: "dont lose lil sebastian", employee_id: andy.id)
garbage = Ticket.create(project_id: pit.id, name: "garbage", description: "remove garbage and Andy", employee_id: april.id)
homepage = Ticket.create(project_id: infinity.id, name: "build website", description: "build homepage for infinty", employee_id: dwight.id)
ryan = Ticket.create(project_id: infinity.id, name: "Help temp", description: "Ryan wants this done", employee_id: pam.id)
chocolate = Ticket.create(project_id: banana.id, name: "make chocolate", description: "to sell chocolate bananas", employee_id: george.id)
burn = Ticket.create(project_id: banana.id, name: "burn it down", description: "Kill it with fire", employee_id: gob.id)
tracy = Ticket.create(project_id: tv.id, name: "babysit tracy", description: "He needs help", employee_id: liz.id)


pit_april = EmployeeProject.create(project_id: pit.id, employee_id: april.id)
fest_andy = EmployeeProject.create(project_id: fest.id, employee_id: andy.id)
pit_andy = EmployeeProject.create(project_id: pit.id, employee_id: andy.id)
paper_dwight = EmployeeProject.create(project_id: paper.id, employee_id: dwight.id)
paper_pam = EmployeeProject.create(project_id: paper.id, employee_id: pam.id)
infinity_dwight = EmployeeProject.create(project_id: infinity.id, employee_id: dwight.id)
house_gob = EmployeeProject.create(project_id: house.id, employee_id: gob.id)
house_george = EmployeeProject.create(project_id: house.id, employee_id: george.id)
banana_gob = EmployeeProject.create(project_id: banana.id, employee_id: gob.id)
tv_liz = EmployeeProject.create(project_id: tv.id, employee_id: liz.id)
