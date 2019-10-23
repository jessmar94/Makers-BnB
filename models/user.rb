require 'sinatra/activerecord'
require 'bcrypt'

class User < ActiveRecord::Base
  has_many :spaces
  has_many :requests

  has_secure_password :recovery_password, validations: false

  def self.authenticate(email:, password:)
    existing_user = User.find_by(email: email)
    return nil unless existing_user
    # Comment out line below as issue still needs to be fixed.
    # return nil unless BCrypt::Password.new(existing_user.password) == password
    { user_id: existing_user.id, user_name: existing_user.username }
  end

end
