txt = "Time:        59     79     65     75
# Distance:   597   1234   1032   1328"

time = txt.split("\n")[0].scan(/\d+/).join.to_i
distance = txt.split("\n")[1].scan(/\d+/).join.to_i

somme = 0

for i in 1..time
  remaining_time = time - i
  somme += 1 if (i * remaining_time > distance)
end
 puts somme
