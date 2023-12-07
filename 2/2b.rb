require "../inputs/2.rb"
input = INPUT

somme = 0

def max(arr)
  number = arr.map do |item|
    item.to_i
  end
  return number.max
end

input.split("\n").each do |game|
  round = game.split(/:|;|,/)

    blue = round.find_all{|str| str.include?('blue')}
    green = round.find_all{|str| str.include?('green')}
    red = round.find_all{|str| str.include?('red')}

    somme += (max(blue) * max(green) * max(red))
end
 puts somme
