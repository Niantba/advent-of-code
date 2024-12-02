require "../inputs/1.rb"
input = INPUT

somme = []

input.split.each do |str|
  digit = str.match('\d')
  second = str.reverse.match('\d')
  somme << "#{digit}#{second}".to_i
end

puts somme.sum
