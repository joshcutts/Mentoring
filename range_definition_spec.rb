require_relative 'range_definition'

sample_input = <<~INPUT
seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4
INPUT

seed_to_soil_map = "50 98 2\n52 50 48"

describe RangeDefinition do
  # it 'parses destination range start' do
  #   range_definition = RangeDefinition.new("50 98 2")
  #   expect(range_definition.destination_range_start).to eq(50)
  # end

  # it 'parses source range start' do
  #   range_definition = RangeDefinition.new("50 98 2")
  #   expect(range_definition.source_range_start).to eq(98)
  # end

  # it 'parses source range length' do
  #   range_definition = RangeDefinition.new("50 98 2")
  #   expect(range_definition.source_range_length).to eq(2)
  # end

  it 'get seeds from input' do
    range_definition = RangeDefinition.new("50 98 2\n52 50 48")
    expect(range_definition.parse_ranges).to eq([[50, 98, 2], [52, 50, 48]])
  end
end
