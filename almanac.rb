class Almanac
  attr_reader :seeds, :maps, :seeds_from_ranges

  def initialize(raw_almanac)
    @raw_almanac = raw_almanac
    @seeds, *@maps = @raw_almanac.split(/\n\n/)
    @seeds = get_seeds
    @maps = get_maps
    @seeds_from_ranges = generate_seeds_from_ranges
  end

  def get_seeds
    @seeds.split(":")[1].split.map(&:to_i)
  end

  def generate_seeds_from_ranges
    seeds_from_ranges = []
    index = 0
    loop do
      start = @seeds[index]
      range = @seeds[index+1]
      (start..start+range-1).each { |seed| seeds_from_ranges << seed }
      index += 2
      break if index >= @seeds.length
    end
    seeds_from_ranges
  end

  def get_maps
    @maps.map { |type| type.split("\n")[1..-1]
    .map { |range| range.split.map(&:to_i) } }
  end

  def seed_to_soil
    soil = []
    
    @soil_map = @maps[0]
    @seeds.each do |seed|
      seed_not_in_range = []
      @soil_map.each do |dest_range_start, source_range_start, source_range_length|
        source_range_end = source_range_start + source_range_length - 1
        if seed.between?(source_range_start, source_range_end)
          difference = dest_range_start - source_range_start
          soil << (seed + difference)
          seed_not_in_range << false
        else
          seed_not_in_range << true
        end
      end
      soil << seed if seed_not_in_range.all?
    end
    soil
  end

  def seed_to_loc
    seeds = @seeds

    @maps.each do |map|
      converted_seeds = {}
      map.each do |range_definition|
        destination_range_start = range_definition[0]
        source_range_start = range_definition[1]
        source_range_length = range_definition[2]
        source_range_end = source_range_start + source_range_length - 1

        seeds.each_with_index do |seed, seed_num|
          if seed.between?(source_range_start, source_range_end)
            difference = destination_range_start - source_range_start
            converted_seeds[seed_num] = (seed + difference)
          end
        end
      end

      converted = []
      (0..seeds.length-1).each do |i|
        if converted_seeds.keys.include?(i)
          converted[i] = converted_seeds[i]
        else
          converted[i] = seeds[i]
        end
      end
      seeds = converted
    end
    @locs = seeds
  end

  def find_minimum_loc
    seed_to_loc
    @locs.min
  end
end

almanac = Almanac.new(File.read("/Users/joshuacutts/Documents/Documents-MacBook_Pro/LaunchSchool/RB110/Mentoring/sample_input.txt"))
p almanac.seed_to_loc
p almanac.find_minimum_loc