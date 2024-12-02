require "../inputs/1.rb"
input = INPUT

somme = []

input.gsub!(/(one|two|three|four|five|six|seven|eight|nine)/, 'one' => 'o1e', 'two' => 't2o', 'three' => 't3e', 'four' => 'f4r',
'five' => 'f5e', 'six' => 's6x', 'seven' => 's7n', 'eight' => 'e8t', 'nine' => 'n9e')

input.gsub!(/(one|two|three|four|five|six|seven|eight|nine)/, 'one' => 'o1e', 'two' => 't2o', 'three' => 't3e', 'four' => 'f4r',
'five' => 'f5e', 'six' => 's6x', 'seven' => 's7n', 'eight' => 'e8t', 'nine' => 'n9e')

input.split.each do |str|
  digit = str.match('\d')
  second = str.reverse.match('\d')
  somme << "#{digit}#{second}".to_i
end

puts somme.sum
