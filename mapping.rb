class Mapping
  def initialize(raw_mapping)
    @destination_range_start = raw_mapping.split[0].to_i
  end

  def destination_range_start
    @destination_range_start
  end
end