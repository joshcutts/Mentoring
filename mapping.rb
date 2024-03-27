class RangeDefinition
  def initialize(raw_mapping)
    @numbers = raw_mapping.split.map(&:to_i)
  end

  def destination_range_start
    @numbers[0]
  end

  def source_range_start
    @numbers[1]
  end

  def source_range_length
    @numbers[2]
  end
end