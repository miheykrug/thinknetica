symbols = Hash[("a".."z").to_a.zip((1..26).to_a)]

symbols.delete_if { |k, v| k.count("aeoui") == 0 }

puts symbols
