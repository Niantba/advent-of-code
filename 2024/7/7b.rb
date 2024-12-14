require '../inputs/7.rb'

input = INPUT.split("\n")

def calculate_values(test_values, operators)
  result = test_values[0]

  test_values[1..-1].each_with_index do |value, index|
    operator = operators[index]
    if operator == "+"
      result += value
    elsif operator == "*"
      result *= value
    elsif operator == "||"
      result = (result.to_s + value.to_s).to_i
    end
  end

    result
end

def is_valid(test_results, test_values)
  num_of_operators = test_values.length - 1

  ["+", "*", "||"].repeated_permutation(num_of_operators).each do |operators|
    result = calculate_values(test_values, operators)
    return true if result == test_results
  end
  false
end

def calculate_valid(input)
  result = 0
  input.each do |line|
    test_results = line.split(": ")[0].to_i
    test_values = line.split(": ")[1].split(" ").map{|x| x.to_i}

    result += test_results if is_valid(test_results, test_values)
  end

  result
end

print calculate_valid(input)
