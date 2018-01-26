puts 'Для выхода введите "stop" '
cart = {}
loop do
  puts "Введите название товара"
  item = gets.chomp
  break if item == "stop"
  
  puts "Введите цену товара"
  price = gets.chomp.to_f
  
  puts "Введите количество товара"
  quantity = gets.chomp.to_i
  
  prod = { price: price, quantity: quantity}
  cart[item] = prod
end

orpder_price = 0

cart.each do |name, prod|
  prod_price = 1
  
  prod.each do |k, v|
    prod_price *= v
  end
  
  puts "Общая стоимость товара #{name}: #{prod_price}"
  
  orpder_price += prod_price
end

puts "Общая сумма всех покупок: #{orpder_price}"
puts cart
