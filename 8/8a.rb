require "../inputs/8.rb"
input = INPUT

directions = input.split("\n")[0].split("")

maps = input.split("\n").select { |line| line.include?('=') }

coordinates = maps.map do |line|
  line.split(" =")[0]
end

destinations = maps.map do |line|
  line.split(/[^A-Z]/).reject(&:empty?).slice(1,2)
end

map = Hash[coordinates.zip(destinations)]

coordinate = "AAA"
steps = 0

while coordinate != "ZZZ"
  direction = directions[steps % directions.length]

  if direction == "L"
    coordinate = map[coordinate][0]
  else
    coordinate = map[coordinate][1]
  end
  steps += 1
end

puts steps
