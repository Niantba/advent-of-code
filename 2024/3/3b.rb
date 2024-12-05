require '../inputs/3.rb'

input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"

input = INPUT.scan(/mul\((\d+),(\d+)\)|(do\(\))|(don't\(\))/).map {|x| x.compact}

def calculate(input)
  mul_enabled = true
  result = 0

  input.each do |match|
    case match[0]
    when /\d+/
        result += match[0].to_i * match[1].to_i if mul_enabled
    when 'do()'
      mul_enabled = true
    when "don't()"
      mul_enabled = false
    end
  end
  result
end

print calculate(input)
