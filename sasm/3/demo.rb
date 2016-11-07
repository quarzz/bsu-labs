require_relative "exponential.rb"
require_relative "stat.rb"

require 'set'

N = 100

ed = Exponential.new

sample = Array.new(N) { ed.next }

p Stat.kolmogorov(sample, ed.function)
