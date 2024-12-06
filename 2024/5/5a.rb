require '../inputs/5.rb'

rules = INPUT.split("\n\n")[0].split("\n").map { |rule| rule.split("|").map(&:to_i) }
page_numbers = INPUT.split("\n\n")[1].split("\n").map { |page| page.split(",").map(&:to_i) }

count = 0

def check_rules?(rules, page)
  rules.each do |rule|
    if page.include?(rule[0]) && page.include?(rule[1])
      if page.index(rule[0]) > page.index(rule[1])
      return false
      end
    end
  end
  true
end

page_numbers.each do |page|
  count += page[page.length/2] if check_rules?(rules, page)
end

print count
