require_relative 'constants'

class MGenerator
  def initialize(x, y, k = K)
    @x, @y, @k = x, y, k
    @v = Array.new(@k) { @x.next }
  end

  def next
    s = (@y.next * @k).to_i
    result = @v[s]
    @v[s] = @x.next
    result
  end
end
