require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it { is_expected.to respond_to(:instruct_to_land) }
  it { is_expected.to respond_to(:cleared_for_take_off) }

  describe '#instruct_to_land' do
    it 'lands a plane in the airport and registers its arrival' do
      expect(airport.instruct_to_land(plane)).to eq [plane]
    end
  end
  
  describe '#cleared_for_take_off' do
    it 'allows a plane to take off and registers its departure' do
      airport.instruct_to_land(plane)
      expect(airport.planes).not_to include @plane
    end
  end

  describe '#capacity' do
    it 'registers when airport is full and raises an error' do
      20.times { airport.instruct_to_land(plane) }
      expect { airport.instruct_to_land(plane) }.to raise_error("No stands available, do not land")
    end
  end

end
