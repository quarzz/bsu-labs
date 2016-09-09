require_relative 'lcg'
require_relative 'mgenerator'
require_relative 'stat'

d1 = LCG.new
p Stat::pearson(d1) #12.625 => p between 0.9 and 0.95

srand 2**5

x = LCG.new
def x.next
  rand()
end
y = LCG.new

d3 = MGenerator.new(x, y)
p Stat::pearson(d3) #10.375 => p between 0.95 and 0.99


d1 = LCG.new
p Stat::kolmogorov(d1) #0.735

srand 2**5

x = LCG.new
def x.next
  rand()
end
y = LCG.new

d3 = MGenerator.new(x, y)
p Stat::kolmogorov(d3) #0.535
