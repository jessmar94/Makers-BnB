require 'sinatra/activerecord'

class Request < ActiveRecord::Base
  has_many :availability
  belongs_to :user

  def accept
    self.status = "Accepted"
    self.save
  end

  def decline
    self.status = "Rejected"
    self.save
  end

end
