require "../inputs/8.rb"
input = INPUT

# input = "LR

# 11A = (11B, XXX)
# 11B = (XXX, 11Z)
# 11Z = (11B, XXX)
# 22A = (22B, XXX)
# 22B = (22C, 22C)
# 22C = (22Z, 22Z)
# 22Z = (22B, 22B)
# XXX = (XXX, XXX)"

directions = input.split("\n")[0].split("")

maps = input.split("\n").select { |line| line.include?('=') }

coordinates = maps.map do |line|
  line.split(" =")[0]
end

destinations = maps.map do |line|
  line.split(/\W/).reject(&:empty?).slice(1,2)
end

map = Hash[coordinates.zip(destinations)]

starting_points = coordinates.select {|coordinate| coordinate.end_with?("A")}

# def over?(starting_points)
#   starting_points.all? {|point| point.end_with?("Z")}
# end

# continue = true
steps = []

# while continue
#   continue = !over?(starting_points)
#   direction = directions[steps % directions.length]

#   starting_points.each_with_index do |point, index|
#     if direction == "L"
#       starting_points[index] = map[point][0]
#     else
#       starting_points[index] = map[point][1]
#     end
#   end

#   steps += 1
# end

# puts steps - 1

starting_points.each_with_index do |starting_point, index|
  i = 0
  while !starting_point.end_with?("ZZZ")
    direction = directions[i % directions.length]

    if direction == "L"
      starting_point = map[starting_point][0]
    else
      starting_point = map[starting_point][1]
    end
    steps[index] = i
    i += 1
  end
  steps << steps[index]
end
