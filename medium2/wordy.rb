class WordProblem
  attr_reader :question

  def initialize(str)
    @question = str
  end

  def format_equation(string)
    string = string.dup
    string = string.gsub('plus', '+')
    string = string.gsub('minus', '-')
    string = string.gsub('divided by', '/')
    string = string.gsub('multiplied by', '*')
    string
  end

  def answer
    raise ArgumentError unless question.match(/What is -*[0-9]+ (?:plus|minus|divided by|multiplied by) -*[0-9]+(?: (?:plus|minus|divided by|multiplied by) -*[0-9]+)*\?/)

    string = question.match(/-*[0-9]+ (plus|minus|multiplied by|divided by) -*[0-9]+( (plus|minus|multiplied by|divided by) -*[0-9]+)*/).to_s
    equation = format_equation(string)
    split_equation = equation.split

    current_total = 0
    count = 0
    
    loop do
      if count.zero?
        current_equation = split_equation.shift(3)
      
        first_num = current_equation.first.to_i
        second_num = current_equation.last.to_i
        operation = current_equation[1].to_sym

        current_total += first_num.send(operation, second_num)
      elsif !split_equation.empty?
        current = split_equation.shift(2)
        operation = current[0].to_sym
        second_num = current[1].to_i

        current_total = current_total.send(operation, second_num)
      else
        return current_total
      end

      count += 1
    end
  end
end
