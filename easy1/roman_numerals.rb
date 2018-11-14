class Integer
  ROMAN_NUMERAL_RULES = {
    'M' => 1000,
    'CM' => 900,
    'D' => 500,
    'CD' => 400,
    'C' => 100,
    'XC' => 90,
    'L' => 50,
    'XL' => 40,
    'X' => 10,
    'IX' => 9,
    'V' => 5,
    'IV' => 4,
    'I' => 1
  }

  def to_roman
    current_val = self
    result = ''

    ROMAN_NUMERAL_RULES.each do |roman_sym, number|
      loop do
        if (current_val - number) >= 0
          current_val -= number
          result << roman_sym
          next
        end
        break
      end
    end
    
    result
  end
end
