require_relative 'DUD.rb'
require_relative 'bd.rb'
require_relative 'stat.rb'


distr = DUD.new(1, 10, 100, 1_000, 10_000, 100_000, 1_000_000)

sample = Array.new(100) { distr.next }

chi_squared = chi_squared(sample)

p chi_squared


prob = 0.7
distr =  BD.new(prob)

sample = Array.new(100) { distr.next }

puts "0: #{sample.count(0)}"
puts "1: #{sample.count(1)}"

p chi_squared2(sample, prob)

# n = 100, k = 1?? chi_squared(1) = 0.047619
# table:
# p => value
# 0.9 => 0.016
# 0.75 => 0.102



# n = 100; k = 7; chi_squared(6} = 3.0399999999999996
# table:
# p => value
# 0.9 => 2.20413
# 0.75 => 3.4546
