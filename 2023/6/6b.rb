require "../inputs/6.rb"
input = INPUT

time = input.split("\n")[0].scan(/\d+/).join.to_i
distance = input.split("\n")[1].scan(/\d+/).join.to_i

somme = 0

for i in 1..time
  remaining_time = time - i
  somme += 1 if (i * remaining_time > distance)
end
 puts somme
