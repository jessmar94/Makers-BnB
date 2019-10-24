users = [
  {username: 'Mr test', email: 'test@test.com', password: 'xxxx'}
]

users.each do |user|
  new_user = User.create(user)
  new_space = Space.create(name: 'My Place', description: 'An awesome place', ppn: 5099, user_id: new_user.id)
  Availability.create(spaces_id: new_space.id, date_offered: '2019-10-31')
  Availability.create(spaces_id: new_space.id, date_offered: '2019-11-03')
end
