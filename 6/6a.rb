txt = "Time:        59     79     65     75
Distance:   597   1234   1032   1328"

time = txt.split("\n")[0].scan(/\d+/).map(&:to_i)
distance = txt.split("\n")[1].scan(/\d+/).map(&:to_i)

wins = []
x = 0

time.each do |t|
  for i in 1..t
    remaining_time = t - i
    wins << t if (i * remaining_time > distance[x])
  end
  x += 1
end

somme = 1

time.each do |t|
  somme *= wins.count(t)
end

puts somme
