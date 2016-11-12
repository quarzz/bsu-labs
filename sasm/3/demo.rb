require_relative "exponential.rb"
require_relative "gamma.rb"
require_relative "stat.rb"

require 'set'

N = 100

ed = Exponential.new

sample = Array.new(N) { ed.next }

p Stat.kolmogorov(sample, ed.function)

gd = Gamma.new(4.232, 1)

sample = Array.new(N) { gd.next }

# puts sample.sort

p Stat.kolmogorov(sample, gd.function)
