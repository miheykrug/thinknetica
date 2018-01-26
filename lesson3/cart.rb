puts 'Для выхода введите "stop" '
cart = {}
orpder_price = 0
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
  prod_price = price * quantity
  orpder_price +=prod_price

  puts "Общая цена товара равна #{prod_price}"
end
puts "Общая сумма всех покупок: #{orpder_price}"
puts cart
