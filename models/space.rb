require 'sinatra/activerecord'

class Space < ActiveRecord::Base
  has_many :requests
  belongs_to :user

  def accept_request(request_id:)
    this_request = Request.find(request_id)
    this_request.status = "Accepted"
    this_request.save
  end

  def decline_request(request_id:)
    this_request = Request.find(request_id)
    this_request.status = "Accepted"
    this_request.save
  end

end
