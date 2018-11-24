class Series
  attr_reader :num_string

  def initialize(num_string)
    @num_string = num_string
  end

  def number_slices(slice_length)
    (num_string.size - slice_length) + 1
  end

  def slices(slice_length)
    raise ArgumentError if slice_length > num_string.length

    num_series = number_slices slice_length

    num_series.times.with_object([]) do |index, result|
      result << num_string[index, slice_length].split("").map(&:to_i)
    end
  end
end
