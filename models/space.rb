require 'sinatra/activerecord'

class Space < ActiveRecord::Base
  has_many :requests
  belongs_to :user

end
