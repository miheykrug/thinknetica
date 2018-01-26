fib = [1, 1]
j = 1
sum = 1
while sum < 100
  fib[j] = sum
  j += 1
  sum = fib[j-1] + fib[j-2]
end

puts fib.to_s
