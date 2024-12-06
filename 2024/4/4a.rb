require "../inputs/4.rb"

input = INPUT.split("\n")

def count_xmas(input)
  count = 0

  def check_direction(input, x, y, dx, dy, word)
    word_length = word.length
    chars = ""

    word_length.times do |i|
            new_x = x + i * dx
            new_y = y + i * dy
            return false if new_x < 0 || new_y < 0 || new_x >= input.length || new_y >= input[0].length
            chars += input[new_x][new_y]
          end

    chars == 'XMAS'
  end

  input.each_with_index do |row, i|
    row.each_char.with_index do |char, j|
      count += 1 if check_direction(input, i, j, 0, 1, 'XMAS')
      count += 1 if check_direction(input, i, j, 0, -1, 'XMAS')
      count += 1 if check_direction(input, i, j, 1, 0, 'XMAS')
      count += 1 if check_direction(input, i, j, -1, 0, 'XMAS')
      count += 1 if check_direction(input, i, j, 1, 1, 'XMAS')
      count += 1 if check_direction(input, i, j, -1, -1, 'XMAS')
      count += 1 if check_direction(input, i, j, 1, -1, 'XMAS')
      count += 1 if check_direction(input, i, j, -1, 1, 'XMAS')
    end
  end

  count
end

puts count_xmas(input)
