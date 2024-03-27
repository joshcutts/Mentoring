require_relative 'mapping'

describe Mapping do
  it 'parses destination range start' do
    mapping = Mapping.new("50 98 2")
    expect(mapping.destination_range_start).to eq(50)
  end

  it 'parses source range start' do
    mapping = Mapping.new("50 98 2")
    expect(mapping.source_range_start).to eq(98)
  end

  it 'parses source range length' do
    mapping = Mapping.new("50 98 2")
    expect(mapping.source_range_length).to eq(2)
  end
end
