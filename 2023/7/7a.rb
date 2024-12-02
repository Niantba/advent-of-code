require "../inputs/7.rb"
input = INPUT

txt = '32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483'

ORDERED_CARDS = ["2","3","4","5","6","7","8","9","T","J","Q","K","A"]

cards = []
bids = []

txt.split("\n").each do |hand|
  cards << hand.split(" ")[0]
  bids << hand.split(" ")[1]
end

cards = cards.map do |hand|
  hand.split("").map do |card|
    (ORDERED_CARDS.index(card) + 1) ** (ORDERED_CARDS.index(card) + 1)
  end
end

hands = Hash[cards.zip(bids)]
# hands.transform_keys { |key| key.sum}

valued_hands = {}

hands.each do |hand, value|
  if five_of_a_kind?(hand)
    new_key = hand.sum * 70_000_000
    valued_hands[new_key] = value
  elsif four_of_a_kind?(hand)
    new_key = hand.sum * 6_000_000
    valued_hands[new_key] = value
  elsif full_house?(hand)
    new_key = hand.sum * 500_000
    valued_hands[new_key] = value
  elsif three_of_a_kind?(hand)
    new_key = hand.sum * 40_000
    valued_hands[new_key] = value
  elsif two_pairs?(hand)
    new_key = hand.sum * 3_000
    valued_hands[new_key] = value
  elsif one_pair?(hand)
    new_key = hand.sum * 200
    valued_hands[new_key] = value
  else
    new_key = hand.sum * 10
    valued_hands[new_key] = value
  end
end





sorted_hands = hands.sort_by {|k,v| k}

somme = 0

sorted_hands.each_with_index do |hand, index|
  somme += hand[1].to_i * (index + 1)
  puts "#{hand[0]} #{hand[1]} #{index + 1}"
  puts hand[1].to_i * (index + 1)
  puts somme
end





def five_of_a_kind?(hand)
  hand.uniq.length == 1
end

def four_of_a_kind?(hand)
  hand.uniq.length == 2 && hand.count(hand.uniq[0]||hand.uniq[-1]) == 4
end

def full_house?(hand)
  hand.uniq.length == 2 && !four_of_a_kind?(hand)
end

def three_of_a_kind?(hand)
  hand.uniq.length == 3 && hand.count(hand.uniq[0]||hand.uniq[-1]) == 3
end

def two_pairs?(hand)
  hand.uniq.length == 3 && !three_of_a_kind?(hand)
end

def one_pair?(hand)
  hand.uniq.length == 4
end
