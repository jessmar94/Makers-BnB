require './models/space'

describe Space do

  describe ".createSpace" do
    it "creates a new Space" do
      space1 = Space.create(name: "London Flat", description: "A beautiful place to stay", ppn: 4000)
      expect(space1.name).to eq "London Flat"
      expect(space1.description).to eq "A beautiful place to stay"
      expect(space1.ppn).to eq 4000
    end
  end

end
