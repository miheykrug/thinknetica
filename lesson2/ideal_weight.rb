  print "Как Вас зовут? "
  name = gets.chomp

  print "Какой Ваш рост? "
  height = gets.to_i

  ideal_weight = height - 110
if ideal_weight >= 0
  print "#{name}, Ваш идеальный вес - #{ideal_weight}"
else
  print "Ваш вес уже оптимальный"
end