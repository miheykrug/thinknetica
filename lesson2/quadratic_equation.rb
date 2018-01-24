print "Введите коэффициент a: "
a = gets.to_i

print "Введите коэффициент b: "
b = gets.to_i

print "Введите коэффициент c: "
c = gets.to_i

d = b**2 - 4 * a * c
if d >= 0
  x1 = (-b + Math.sqrt(d)) / (2 * a)
  x2 = (-b - Math.sqrt(d)) / (2 * a)
  print ("Дискриминант равен: #{d}. Корни #{x1} #{x2 if x1 != x2}")
else
  print ("Дискриминант равен: #{d}. Корней нет")
end

