require 'rails_helper'

describe 'Employee' do
  before do
    @knope = Employee.create(name: "Leslie Knope", title: "City Council", username: "leslieknope", manager_id: nil, email: "knope@gmail.com", password_digest: BCrypt::Password.create("1234"))
    @swanson = Employee.create(name: "Ron Swanson", title: "Director", username: "ronswanson", manager_id: nil, email: "swanson@gmail.com", password_digest: BCrypt::Password.create("1234"))
    @april = Employee.create(name: "April Ludgate", title: "Deputy Director of Animal Control", manager_id: @swanson.id, username: "aprilludgate", email: "april@gmail.com", password_digest: BCrypt::Password.create("1234"))
    @andy = Employee.create(name: "Andy Dwyer", title: "Shoe Shiner", manager_id: @knope.id, username: "andydwyer", email: "andy@gmail.com", password_digest: BCrypt::Password.create("1234"))
    @pit = Project.create(name: "the pit", description: "fill the pit")
    @fest = Project.create(name: "harvest festival", description: "hold the harvest festival")
    @dirt = Ticket.create(project_id: @pit.id, name: "dirt", description: "put some dirt in it", employee_id: @andy.id, due_date: DateTime.strptime("09/01/2009", "%m/%d/%Y"))
    @lilsebastian = Ticket.create(project_id: @fest.id, name: "Lil Sebastian", description: "dont lose lil sebastian", employee_id: @andy.id, due_date: DateTime.strptime("09/01/2009", "%m/%d/%Y"))
    @garbage = Ticket.create(project_id: @pit.id, name: "garbage", description: "remove garbage and Andy", employee_id: @april.id, due_date: DateTime.strptime("09/01/2009", "%m/%d/%Y"))
    @pit_april = EmployeeProject.create(project_id: @pit.id, employee_id: @april.id)
    @fest_andy = EmployeeProject.create(project_id: @fest.id, employee_id: @andy.id)
    @pit_andy = EmployeeProject.create(project_id: @pit.id, employee_id: @andy.id)
  end


  it 'has a name' do
    expect(@knope.name).to eq("Leslie Knope")
  end

  it 'has a title' do
    expect(@knope.title).to eq("City Council")
  end

  it 'has many tickets' do
    expect(@andy.tickets).to eq([@dirt, @lilsebastian])
  end

  it 'has many projects, through employeeprojects' do
    expect(@andy.projects).to eq([@fest, @pit])
  end

end
