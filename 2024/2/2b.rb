require '../inputs/2.rb'

input = INPUT.split("\n").map { |line| line.split.map(&:to_i) }

def consecutive_diff?(line)
  line.each_cons(2).all? { |a, b| (a - b).abs == 1 || (a - b).abs == 2 || (a - b).abs == 3}
end

def increasing?(line)
  line.each_cons(2).all? { |a, b| a < b }
end

def decreasing?(line)
  line.each_cons(2).all? { |a, b| a > b }
end

def is_safe?(line)
  consecutive_diff?(line) && (increasing?(line) || decreasing?(line))
end

def safe_with_dampener?(line)
  return true if is_safe?(line)

  (0...line.length).each do |i|
    modified_line = line[0...i] + line[i+1..-1]
    is_safe?(modified_line)
  end

  false
end

safe = input.count { |line| safe_with_dampener?(line) }

print safe
