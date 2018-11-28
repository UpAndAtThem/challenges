class DNA
  attr_reader :dna_sequence

  def initialize(dna)
    @dna_sequence = dna
  end

  def hamming_distance(other_genetic_makeup)
    index = 0
    hamming_distance = 0
    dna_length = dna_sequence.length

    other_genetic_makeup[0, dna_length].chars.each do |nucleobase|
      hamming_distance += 1 unless dna_sequence[index] == nucleobase
      index += 1
    end

    hamming_distance
  end
end
