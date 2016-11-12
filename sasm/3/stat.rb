module Stat
  def Stat.kolmogorov(sample, function)
      dn = sample.sort.each_with_index.inject(0) do |sup, (value, index)|
          [sup, (function[value] - index.to_f / sample.size).abs].max
      end

      dn * Math.sqrt(sample.size)
  end
end
