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
    this_request.status = "Declined"
    this_request.save
  end

  def add_dates(start_date:, end_date: nil)
    return Availability.create(spaces_id: self.id, date_offered: start_date) if end_date.nil?

    dates = (start_date..end_date).to_a
    dates.each do |date|
      Availability.create(spaces_id: self.id, date_offered: date)
    end
  end

  def delete_dates(start_date:, end_date: nil)
    if end_date.nil?
      dates = [start_date]
    else
      dates = (start_date..end_date).to_a
    end
    dates.each do |date|
      delete_date = Availability.where(spaces_id: self.id, date_offered: date)
      Availability.destroy(delete_date[0].id)
    end
  end

  def edit_description (text:)
    self.description = text
    self.save
  end
end
