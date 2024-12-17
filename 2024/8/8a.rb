require '../inputs/8.rb'
require 'set'

input = INPUT.split("\n")

antennas = {}

input.each_with_index do |row, y|
  row.chars.each_with_index do |char, x|
    antennas[[x, y]] = char if char != "."
  end
end

frequency_groups = antennas.group_by { |_, frequency| frequency }

frequency_groups = Hash.new { |h, k| h[k] = [] }
antennas.each do |location, frequency|
  frequency_groups[frequency] << location
end

antinode_locations = Set.new

frequency_groups.each do |frequency, locations|
  locations.combination(2).each do |(x1, y1), (x2, y2)|
    dist1 = (x1 - x2).abs + (y1 - y2).abs

    antinode1 = [2 * x1 - x2, 2 * y1 - y2]
    antinode2 = [2 * x2 - x1, 2 * y2 - y1]

    if antinode1[0] >= 0 && antinode1[1] >= 0 && antinode1[0] < input[0].length && antinode1[1] < input.length
      antinode_locations << antinode1
    end
    if antinode2[0] >= 0 && antinode2[1] >= 0 && antinode2[0] < input[0].length && antinode2[1] < input.length
      antinode_locations << antinode2

  end
  end
end

print antinode_locations.size
