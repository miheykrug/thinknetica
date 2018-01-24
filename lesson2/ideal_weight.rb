  print "Как Вас зовут? "
  name = gets.chomp

  print "Какой Ваш рост? "
  height = gets.to_i

  ideal_weight = height - 110
if ideal_weight >= 0
  puts "#{name}, Ваш идеальный вес - #{ideal_weight}"
else
  puts "Ваш вес уже оптимальный"
end
