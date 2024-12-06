require "../inputs/4.rb"

input = INPUT.split("\n")

def count_x_mas(input)
  count = 0
  rows = input.length
  cols = input[0].length

  for i in 1..rows-2
    for j in 1..cols-2
      if input[i][j] == "A"
        if (input[i-1][j-1] == "M" && input[i+1][j+1] == "S") &&
           (input[i-1][j+1] == "M" && input[i+1][j-1] == "S")
          count += 1
        elsif (input[i-1][j-1] == "S" && input[i+1][j+1] == "M") &&
          (input[i-1][j+1] == "S" && input[i+1][j-1] == "M")
         count += 1
        elsif (input[i-1][j-1] == "M" && input[i+1][j+1] == "S") &&
          (input[i-1][j+1] == "S" && input[i+1][j-1] == "M")
         count += 1
        elsif (input[i-1][j-1] == "S" && input[i+1][j+1] == "M") &&
          (input[i-1][j+1] == "M" && input[i+1][j-1] == "S")
         count += 1
        end
      end
    end
  end

  count
end

puts count_x_mas(input)
