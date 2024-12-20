require '../inputs/2.rb'

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
