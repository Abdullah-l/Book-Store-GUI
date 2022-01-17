x = 1

# A. Print out the binary presentation of 1
puts x.to_s(2)

# B. Print out whether it’s even or odd
if x.even?
  puts 'x is even'
elsif x.odd?
  puts 'x is odd'
end

# C. Subtract 2, print the result
x -= 2
puts x

# D. Divide the result by 2,print the result
x /= 2
puts x

# E. Add 1/1/4, print the result
x += 1.25.to_r
puts x

# F. print the numerator and denominator of result
puts x.numerator
puts x.denominator

# G. Multiply by ⅓ , print the result
x *= 1/3r
puts x

# H. Round to 3 decimal places, print the result
x = x.round(3)
puts x

# I. Save the result as a string y, print the result
y = x.to_s
puts y

# J. Convert y to integer,print it
puts y.to_i

# K. Convert y to decimal,print it
puts y.to_f
