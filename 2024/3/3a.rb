require '../inputs/3.rb'

pairs = INPUT.scan(/mul\((\d+),(\d+)\)/).map { |pair| pair.map(&:to_i) }

result = pairs.map { |pair| pair.reduce(:*) }.reduce(:+)

print result
