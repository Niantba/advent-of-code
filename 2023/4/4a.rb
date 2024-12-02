require "../inputs/4.rb"
input = INPUT

cards = input.split("\n")

numbers = cards.map do |card|
  card.split(/:|\|/).slice(1,2).map! { |line| line.split(' ').map(&:to_i) }
end

winning = []

numbers.each do |combinaition|
  winning << (combinaition[0]&combinaition[1]) if combinaition[0]&combinaition[1] != []
end

somme = 0

winning.each do |card|
  if card.length == 1
    somme += 1
  elsif card.length == 2
    somme += 2
  else
    somme += (2 ** (card.length - 1))
  end
end

puts somme
