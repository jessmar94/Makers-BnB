require 'sinatra/activerecord'

class Availability < ActiveRecord::Base

  belongs_to :space
  belongs_to :request

end
