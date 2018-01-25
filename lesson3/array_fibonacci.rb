fib1 = [1, 1]

for i in 2..99
  fib1[i] = fib1[i-1] + fib1[i-2]
end

puts fib1.to_s
puts fib1.length

fib2 = [1, 1]
j = 1
loop do
  j += 1
  summ = fib2[j-1] + fib2[j-2]
  break if summ > 100
  fib2[j] = summ
end

puts fib2.to_s
puts fib2.length
