class Random2

  def initialize(x0, p, q)
    @x, @p, @q = x0, p, q
  end

  def next
    @x = (@x * @x) % (@p*@q)
    @x.to_f / (@p*@q)
  end
end
