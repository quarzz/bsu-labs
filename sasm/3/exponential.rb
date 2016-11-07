require_relative "constants.rb"

class Exponential
    attr_reader :function, :inverse

    def initialize(rate = RATE, seed = SEED)
        @rate = rate
        @function = lambda { |x| 1 - Math::E ** (-@rate * x) }
        @inverse = lambda { |y| Math.log(1 - y)/-@rate }
        @brv = Random.new(seed)
    end

    def next
        ra = @brv.rand
        return @inverse[ra]
    end
end
