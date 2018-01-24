print "Введите коэффициент a: "
a = gets.to_f

print "Введите коэффициент b: "
b = gets.to_f

print "Введите коэффициент c: "
c = gets.to_f

d = b**2 - 4 * a * c

if d >= 0
  d_sqrt = Math.sqrt(d)
  x1 = (-b + d_sqrt) / (2 * a)
  x2 = (-b - d_sqrt) / (2 * a)
  puts ("Дискриминант равен: #{d}. Корни: #{x1} #{x2}") if d > 0
  puts ("Дискриминант равен: #{d}. Корень: #{x1}") if d == 0
else
  puts ("Дискриминант равен: #{d}. Корней нет")
end
