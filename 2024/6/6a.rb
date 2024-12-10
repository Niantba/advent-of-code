require '../inputs/6.rb'

map = INPUT.split("\n").map(&:chars)

DIRECTIONS = ['^', '>', 'v', '<']
MOVES = {
  '^' => [-1, 0],
  '>' => [0, 1],
  'v' => [1, 0],
  '<' => [0, -1]
}

def guard_path(map)
  guard_location = nil

  map.each_with_index.map do |row, y|
    row.each_with_index.map do |col, x|
      if col == '^'
        guard_location =[x, y]
      end
    end
  end

  col, row = guard_location
  direction = '^'
  visited_positions = []
  visited_positions << [row, col]

  while row >= 0 && row < map.size && col >= 0 && col < map[0].size
    next_row , next_col = row + MOVES[direction][0], col + MOVES[direction][1]

    if next_row < 0 || next_row >= map.size || next_col < 0 || next_col >= map[0].size
      break
    end

    if map[next_row][next_col] == '#'
      direction = DIRECTIONS[(DIRECTIONS.index(direction) + 1) % 4]
    else
      row, col = next_row, next_col
      visited_positions << [row, col]
    end
  end
  visited_positions.uniq.size
end

print guard_path(map)
