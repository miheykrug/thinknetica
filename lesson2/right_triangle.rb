print "Введите сторону a треугольника: "
a = gets.to_f

print "Введите сторону b треугольника: "
b = gets.to_f

print "Введите сторону c треугольника: "
c = gets.to_f

if a > b && a > c
  h = a
  c1 = b
  c2 = c
elsif b > a && b > c
  h = b
  c1 = a
  c2 = c
else c > a && c > b
  h = c
  c1 = a
  c2 = b
end

if h**2 == c1**2 + c2**2
  print "Данный треугольник является прямоугольным"
  print " и равнобедренным" if c1 == c2
else
  print "Данный треугольник не является прямоугольным"
end
  
