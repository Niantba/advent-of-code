require "../inputs/1.rb"

input = INPUT.split("\n").map { |pair| pair.split('   ').map(&:to_i)}

first_list = input.map { |x| x[0] }.sort
second_list = input.map { |x| x[1] }.sort

total = 0

first_list.each do |x|
  second_list.each do |y|
    if x == y
      total += x
    end
  end
end

print total
