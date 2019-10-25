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

  def remove_availability
    
    if self.end_date.nil?
      dates = [self.start_date]
    else
      dates = (self.start_date..self.end_date).to_a
    end
    dates.each do |date|
      delete_date = Availability.find_by(spaces_id: self.space_id, date_offered: date)
      Availability.destroy(delete_date.id)
    end
  end

  def space_owner 
    return Spaces.find(self.space_id).user_id
  end
  
  def space_name
    return Space.find(self.space_id).name
  end
  
  def space_description
    return Space.find(self.space_id).description
  end

  def self.by_owner(owner_id:)
    requests = []
    all_requests = []
    spaces = Space.where(user_id: owner_id)
    spaces.each do |space|
      requests = Request.where(space_id: space.id)
      requests.each do |request|
        all_requests << request
      end
    end
    return all_requests
  end

end
