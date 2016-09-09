require_relative 'constants'

class LCG
  def initialize(seed = SEED, multiplier = MULTIPLIER, modulus = MODULUS)
    @current_value, @multiplier, @modulus = seed, multiplier, modulus
  end

  def next
    @current_value = (@current_value * @multiplier) % @modulus
    @current_value.to_f / @modulus
  end
end
