require "../inputs/2.rb"
input = INPUT

regex = /([1|2][3-9] red)|([1|2][4-9] green)|([1|2][5-9] blue)/

valid = []
somme = 0

input.split("\n").each do |game|
  valid << game unless game.match?(regex)
end

valid.each do |game|
  digit = game.match('\d+')
  somme += "#{digit}".to_i
end

puts somme
