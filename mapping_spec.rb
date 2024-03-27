require_relative 'mapping'

describe Mapping do
  it 'works' do
    mapping = Mapping.new("50 98 2")
    expect(mapping.destination_range_start).to eq(50)
  end
end

# 50 98 2
# 52 50 48