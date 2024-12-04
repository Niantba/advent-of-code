require '../inputs/2.rb'

input = "7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9"

input = INPUT.split("\n").map { |line| line.split.map(&:to_i) }
safe =0

def consecutive_diff?(line)
  line.each_cons(2).all? { |a, b| (a - b).abs == 1 || (a - b).abs == 2 || (a - b).abs == 3}
end

def increasing?(line)
  line.each_cons(2).all? { |a, b| a < b }
end

def decreasing?(line)
  line.each_cons(2).all? { |a, b| a > b }
end

input.each do |line|
  consecutive_diff?(line) && (increasing?(line) || decreasing?(line)) ? safe += 1 : nil
end

print safe
