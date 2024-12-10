require '../inputs/5.rb'

rules = INPUT.split("\n\n")[0].split("\n").map { |rule| rule.split("|").map(&:to_i) }
page_numbers = INPUT.split("\n\n")[1].split("\n").map { |page| page.split(",").map(&:to_i) }

count = 0

def sort_incorrect(rules, page_numbers)
  correct_order = []
  page_numbers.map do |page|
    ordered = false
    while !ordered
      ordered = true
      rules.each do |rule|
        if page.include?(rule[0]) && page.include?(rule[1])
          if page.index(rule[0]) > page.index(rule[1])
            a = rule[0]
            b = rule[1]
            page[page.index(a)], page[page.index(b)] = b, a
            correct_order << page unless correct_order.include?(page)
            ordered = false
          end
        end
      end
    end
    page
  end
  correct_order
end

count += sort_incorrect(rules, page_numbers).map { |page| page[page.length/2] }.sum
print count
