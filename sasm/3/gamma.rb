require_relative "constants.rb"
require_relative "math_stat.rb"

class Gamma
  attr_reader :function

  def initialize(shape = SHAPE, scale = SCALE)
    @shape = shape
    @scale = scale
    @shape_floor = @shape.to_i
    @shape_fraction = @shape - @shape_floor

    @math = MathStat.new

    @function = lambda do |x|
      @math.incomplete_gamma(@shape, x / @scale) / Math.gamma(@shape)
    end

    @uds = Array.new(@shape_floor) { |i| Random.new(SEED_ARRAY[i]) }
    @u = Random.new(SEED_U)
    @v = Random.new(SEED_V)
    @w = Random.new(SEED_W)
  end

  def next
    ksi = 0

    if @shape_fraction != 0
      loop do
        u = 1 - @u.rand
        v = 1 - @v.rand
        w = 1 - @w.rand
        if u <= 1 / (1 + @shape_fraction / Math::E)
          ksi = v ** (1 / @shape_fraction)
          eta = w * ksi ** (@shape_fraction - 1)
        else
          ksi = 1 - Math.log(v)
          eta = w * Math::E ** (-ksi)
        end
        break if eta <= ksi ** (@shape_fraction - 1) * Math::E ** (-ksi)
      end
    end

    res = ksi
    @uds.each do |ud|
      res -= Math.log(ud.rand)
    end
    res * @scale
  end
end
