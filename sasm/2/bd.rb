require_relative 'constants.rb'

class BD
  def initialize(p = P, seed: SEED_2)
    @p = p
    @random = Random.new(seed)
  end

  def next
    @random.rand < 1 - @p ? 0 : 1
  end
end
