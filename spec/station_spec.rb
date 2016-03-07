require 'station'

describe Station do 

	it "on initialize should have a name" do	
		station1 = Station.new(:euston, 1)	
		expect(station1.name).to eq :euston
	end

	it "on initialize should have a zone" do
		station1 = Station.new(:euston, 1)
		expect(station1.zone).to eq 1
	end

end