require 'airport'

describe Airport do
  it { is_expected.to respond_to(:instruct_to_land) }
  it { is_expected.to respond_to(:cleared_for_take_off) }

  describe '#instruct_to_land' do
    it 'lands a plane in the airport and registers its arrival' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.instruct_to_land(plane)).to eq [plane]
    end
  end
  
  describe '#cleared_for_take_off' do
    it 'allows a plane to take off and registers its leaving' do
      airport = Airport.new
      plane = Plane.new
      airport.instruct_to_land(plane)
      expect(airport.planes).not_to include @plane
    end
  end
end
