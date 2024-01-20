class Stack
    def initialize
      @items = []
    end
  
    def push(item)
      @items.push(item)
    end
  
    def pop
      @items.pop
    end
  
    def is_empty
      @items.empty?
    end
  
    def peek
      @items.last unless is_empty
    end
  
    def size
      @items.size
    end
  end
  
  def calculate(expression)
    stack = Stack.new
    result_stack = []
  
    operations = expression.split("\n")
  
    operations.each do |operation|
      if operation.start_with?(' ')
        operator, operand = operation.strip.split
        operand = operand.to_f
  
        result = case operator
                 when '+'
                   stack.pop + operand
                 when '-'
                   stack.pop - operand
                 when '*'
                   stack.pop * operand
                 when '/'
                   stack.pop / operand
                 end
  
        stack.push(result)
        result_stack.push(result)
      else
        number = operation.to_f
        stack.push(number)
      end
    end
  
    puts "Lista de operações:"
    puts operations.join("\n")
  
    puts "Resultados:"
    result_stack.each { |res| puts res }
  
    stack.pop
  end
  
  expression = <<-EXP
     14 - 8
     5 * 6
     2147483647 + 2
     18 / 3
  EXP
  
  result = calculate(expression)
  puts "Resultado final:", result
  