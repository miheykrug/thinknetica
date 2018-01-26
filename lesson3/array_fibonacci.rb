fib = [1, 1]
while (next_element = fib[-1] + fib[-2]) < 100
  fib << next_element
end

puts fib.to_s
