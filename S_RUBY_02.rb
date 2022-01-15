x = 1

# A. Print out the binary presentation of 1
puts x.to_s(2)

# B. Print out whether it’s even or odd
puts x.odd?

# C. Subtract 2, print the result
x = x - 2
puts x

# D. Divide the result by 2,print the result
x = x/2
puts x

# E. Add 1/1/4, print the result
x = x + 1.25.to_r
puts x

# F. print the numerator and denominator of result
puts x.numerator

# G. Multiply by ⅓ , print the result
puts x.denominator

# H. Round to 3 decimal places, print the result
puts x.round

# I. Save the result as a string y, print the result
y = x.round.to_s
puts y

# J. Convert y to integer,print it
puts Integer(y)

# K. Convert y to decimal,print it
puts Float(y)