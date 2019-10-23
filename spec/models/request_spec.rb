require './models/request'

describe Request do

  describe ".createRequest" do
    date = Date.new(2019,12,20)
    date1 = Date.new(2019,12,21)
    it "creates a new Request" do
      request = Request.create(start_date: date, end_date: date1, status: nil)
      expect(request.start_date).to eq date
      expect(request.status).to eq nil 
    end
  end

end
