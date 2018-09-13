def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  # should be 1 instead of 0, as 0 multiplied by any number equals zero
  product = 1

  digits.each do |digit|
    # 0 multipled by any number equals zero
    product *= digit
  end

  product

end

p digit_product('12345')
