require '../inputs/6.rb'
require 'set'

map = INPUT.split("\n").map(&:chars)

DIRECTIONS = ['^', '>', 'v', '<']
MOVES = {
  '^' => [-1, 0],
  '>' => [0, 1],
  'v' => [1, 0],
  '<' => [0, -1]
}

def get_guard_location(map)
  map.each_with_index do |row, y|
    row.each_with_index do |col, x|
      if col == '^'
        return [x, y]
      end
    end
  end
  nil
end

def guard_path(map, start_direction, start_x, start_y)
  visited_positions = Set.new
  x, y = start_x, start_y
  direction = start_direction
  visited_positions.add([y, x, direction])

  loop do
    next_y, next_x = y + MOVES[direction][0], x + MOVES[direction][1]

    if next_y < 0 || next_y >= map.size || next_x < 0 || next_x >= map[0].size
      return false
    end

    if map[next_y][next_x] == '#'
      direction = DIRECTIONS[(DIRECTIONS.index(direction) + 1) % 4]
    else
      y, x = next_y, next_x
      if visited_positions.include?([y, x, direction])
        return true
      end
      visited_positions.add([y, x, direction])
    end
  end
end

def find_loops(map)
  loop_positions = Set.new
  start_x, start_y = get_guard_location(map)

  map.each_with_index do |row, y|
    row.each_with_index do |cell, x|
      next if [x, y] == [start_x, start_y] || cell == '#'


      temp_map = map.map(&:dup)
      temp_map[y][x] = '#'

      if guard_path(temp_map, '^', start_x, start_y)
        loop_positions.add([x, y])
      end
    end
  end
  loop_positions.size
end

puts find_loops(map)
