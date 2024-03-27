require_relative 'mapping'

describe RangeDefinition do
  it 'parses destination range start' do
    range_definition = RangeDefinition.new("50 98 2")
    expect(range_definition.destination_range_start).to eq(50)
  end

  it 'parses source range start' do
    range_definition = RangeDefinition.new("50 98 2")
    expect(range_definition.source_range_start).to eq(98)
  end

  it 'parses source range length' do
    range_definition = RangeDefinition.new("50 98 2")
    expect(range_definition.source_range_length).to eq(2)
  end
end
