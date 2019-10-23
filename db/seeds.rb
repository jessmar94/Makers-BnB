users = [
  {username: 'Jess', email: 'test@test.com', password: 'xxxx'}
]

users.each do |u|
  User.create(u)
end
