require './models/user'

describe User do

  describe ".createUser" do
    it "saves User to db returning a new User object with the DB id" do
      user1 = User.create(username: "username1", email: "username1@.com", password: "anything")
      expect(user1.username).to eq "username1"
      expect(user1.email).to eq "username1@.com"
      expect(user1.password).to eq "anything"
    end
  end

end
