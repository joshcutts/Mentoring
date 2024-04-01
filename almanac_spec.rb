require_relative 'almanac'

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

describe Almanac do
  it 'get seeds from input' do
    almanac = Almanac.new(sample_input)
    expect(almanac.seeds).to eq([79, 14, 55, 13])
  end

  it 'get maps from input' do
    almanac = Almanac.new(sample_input)
    expect(almanac.maps).to eq([[[50, 98, 2], [52, 50, 48]], [[0, 15, 37], [37, 52, 2], [39, 0, 15]], [[49, 53, 8], [0, 11, 42], [42, 0, 7], [57, 7, 4]], [[88, 18, 7], [18, 25, 70]], [[45, 77, 23], [81, 45, 19], [68, 64, 13]], [[0, 69, 1], [1, 0, 69]], [[60, 56, 37], [56, 93, 4]]])
  end

  it 'convert seed to soil' do
    almanac = Almanac.new(sample_input)
    expect(almanac.seed_to_soil).to eq([81, 14, 57, 13])
  end

  it 'convert seed to location' do
    almanac = Almanac.new(sample_input)
    expect(almanac.seed_to_loc).to eq([82, 43, 86, 35])
  end

  it 'return min loc' do
    almanac = Almanac.new(sample_input)
    expect(almanac.find_minimum_loc).to eq(35)
  end

  it 'return number of seeds treating seed input as ranges' do
    almanac = Almanac.new(sample_input)
    expect(almanac.seeds_from_ranges.length).to eq(27)
  end
end