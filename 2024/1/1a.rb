require "../inputs/1.rb"

input = INPUT.split("\n").map { |pair| pair.split('   ').map(&:to_i)}
first_list = input.map { |x| x[0] }.sort
second_list = input.map { |x| x[1] }.sort

total = 0
index = 0

while index < first_list.length
  total += second_list[index] - first_list[index]
  index +=1
end

print total
