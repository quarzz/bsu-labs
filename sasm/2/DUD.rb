require_relative 'constants.rb'

class DUD
  def initialize(*values, seed: SEED)
    @values = values.sort
    @random = Random.new(seed)
  end

  def next
    @values[(@random.rand * @values.size).to_i]
  end
end
