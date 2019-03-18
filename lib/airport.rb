class Airport
  attr_reader :planes
  CAPACITY = 20
  def initialize(capacity = CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def instruct_to_land(plane)
    raise "No stands available, do not land" unless @planes.count < @capacity
      
    @planes << plane
  end

  def cleared_for_take_off(plane)
    @planes.delete(plane)
  end
end
