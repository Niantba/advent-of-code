txt = "Time:        59     79     65     75
Distance:   597   1234   1032   1328"

times = txt.split("\n")[0].scan(/\d+/).map(&:to_i)
distances = txt.split("\n")[1].scan(/\d+/).map(&:to_i)

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
