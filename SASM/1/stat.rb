module Stat
  def Stat.pearson(random_generator)
    n = 400
    k = 25
    segment_length = 1.0 / k
    segment_count = n / k

    values = []
    n.times do
      values << random_generator.next
    end
    values.sort!

    frequencies = Array.new(k) {|i| 0}
    value_number = 0
    k.times do |segment_number|
      while (value_number < n) && (values[value_number] < segment_length * (segment_number + 1)) do
        frequencies[segment_number] += 1
        value_number += 1
      end
    end

    sum = 0
    k.times do |i|
      tmp = ((frequencies[i]  - n / k) ** 2).to_f / (n / k)
      sum += tmp
    end
    sum
  end

  def Stat.kolmogorov(random_generator)
    n = 400

    values = []
    n.times do
      values << random_generator.next
    end
    values.sort!

    sup = 0
    values.each_with_index do |val, i|
      curr_diff = (i.to_f / n - val).abs
      sup = [curr_diff, sup].max
    end
    sup * Math.sqrt(n)
  end
end
