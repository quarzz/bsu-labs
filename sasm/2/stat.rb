require 'set'

def chi_squared(sample)
  values_set = Set.new
  sample.each { |value| values_set.add(value) }

  elements_count = sample.size
  values_count = values_set.size

  values_sorted = values_set.sort

  segments_count = Math.log2(elements_count).ceil
  segments_count *= 2 if elements_count >= 32
  segments_count = values_count if segments_count > values_count

  p segments_count

  segments = Array.new(segments_count) { Array.new }
  values_set.each_with_index do |value, i|
    segments[i % segments_count] << value
  end

  frequencies = Array.new(segments_count) { 0 }
  sample.each do |value|
    segments.each_with_index do |segment, i|
      frequencies[i] += 1 if segment.include?(value)
    end
  end

  sum = 0
  segments_count.times do |i|
    npk = elements_count * segments[i].size.to_f / values_count
    sum += ((frequencies[i]  - npk) ** 2).to_f / npk
  end

  p frequencies
  p segments

  puts "n = #{elements_count}; k = #{segments_count}; chi_squared(#{segments_count - 1}} = #{sum}"
  sum
end
