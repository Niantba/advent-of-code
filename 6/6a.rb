require "../inputs/6.rb"
input = INPUT

times = input.split("\n")[0].scan(/\d+/).map(&:to_i)
distances = input.split("\n")[1].scan(/\d+/).map(&:to_i)

wins = []
x = 0

times.each do |time|
  for i in 1..time
    remaining_time = time - i
    wins << time if (i * remaining_time > distances[x])
  end
  x += 1
end

somme = 1

times.each do |time|
  somme *= wins.count(time)
end

puts somme
