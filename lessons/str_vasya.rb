def is_length_bool(str)
    str.length.even?
end

str = 'Hello_Vasya!'
puts "String is #{is_length_bool(str)}"
