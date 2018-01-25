months_days = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]

print "Day: "
day = gets.chomp.to_i

print "Month: "
month = gets.chomp.to_i

print "Year: "
year = gets.chomp.to_i

months_days[1] = 29 if ( ( year % 4 == 0 ) && ( year % 100 != 0 ) ) || ( year % 400 == 0 )

count = 0

for i in (0..month-2)
  count += months_days[i]
end

day_number = count + day

puts "Number of this day is #{day_number}"
