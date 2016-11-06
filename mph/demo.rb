require_relative 'rnd'

random_seed = 213

rnd = Random2.new(random_seed, 10**9 + 7, (10**9 - 1) / 9)

(1..10).each do
  puts rnd.next
end
