require '../inputs/8.rb'
require 'set'

input = "............
........0...
.....0......
.......0....
....0.......
......A.....
............
............
........A...
.........A..
............
............"

input = INPUT.split("\n")

antennas = {}

input.each_with_index do |row, y|
  row.chars.each_with_index do |char, x|
    antennas[[x, y]] = char if char != "."
  end
end

frequency_groups = Hash.new { |h, k| h[k] = [] }
antennas.each do |location, frequency|
  frequency_groups[frequency] << location
end

antinode_locations = Set.new

frequency_groups.each do |frequency, locations|

  antinode_locations.merge(locations) if locations.length > 1

  locations.combination(2).each do |(x1, y1), (x2, y2)|
    dx = x2 - x1
    dy = y2 - y1

    gcd = dx.gcd(dy)
    dx /= gcd
    dy /= gcd

    new_x = x1
    new_y = y1
    while new_x >= 0 && new_x < input[0].length && new_y >= 0 && new_y < input.length
      antinode_locations << [new_x, new_y]
      new_x += dx
      new_y += dy
    end

    new_x = x1
    new_y = y1
    while new_x >= 0 && new_x < input[0].length && new_y >= 0 && new_y < input.length
      antinode_locations << [new_x, new_y]
      new_x -= dx
      new_y -= dy
    end

  end
end

print antinode_locations.size
