def calculate(expression)
  stack = Stack.new
  operations = expression.split("\n")

  operations.each do |operation|
    if operation.start_with?(' ')
      # Processa a operação
      operator, operand = operation.strip.split
      operand = operand.to_i

      case operator
      when '+'
        result = stack.pop + operand
      when '-'
        result = stack.pop - operand
      when '*'
        result = stack.pop * operand
      when '/'
        result = stack.pop / operand.to_f
      end

      stack.push(result)
    else
      # Adiciona o número na pilha
      number = operation.to_i
      stack.push(number)
    end
  end

  stack.pop
end
