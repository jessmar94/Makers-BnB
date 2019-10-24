require 'sinatra/activerecord'

class Request < ActiveRecord::Base
  has_many :availability
  belongs_to :user

end
