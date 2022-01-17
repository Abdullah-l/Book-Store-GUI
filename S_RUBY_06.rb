
# Note: the code was written to work on Ruby 2.6
# If grading is based on Ruby 3.0, you can remove the to_s from A and B

# For the symbol :welcome_to_ruby write a program that do the following using Symbol APIs:
symb = :welcome_to_ruby

# A. Checks whether it starts with ‘wel’ or ‘to’ or ‘zzz’
puts symb.to_s.start_with?('wel', 'to', 'zzz')

# B. Checks whether it ends with ‘by’ or ‘zy’
puts symb.to_s.end_with?('by', 'zy')

# C. Prints out the next symbol. Ex: :welcome_to_rubz
p symb.next

# D. Prints out the number of letters excluding the special characters.
puts symb.to_s.gsub!(/[^0-9A-Za-z]/, '').length

# E. Prints out the symbol capitalized then return it back to its original case
puts symb.capitalize
puts symb.capitalize.downcase

# F. Print out the symbol converted to string, then print it back as symbol
puts symb.to_s
puts symb

# G. Create prints an array of symbols out of each letter ex: arr=[:w,:e,:l,:c,:m,:o,....]
p %I[w e l c o m e t o r u b y]