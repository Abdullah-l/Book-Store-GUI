# A. Remove “Hello” , print the text
sentence = "Hello Ruby World"
sentence["Hello "] = ''
puts sentence

# B. Add “Welcome to” to the beginning, print the text
sentence = sentence.insert(0, "Welcome to ")
puts sentence

# C. Replace “World” by your name, print the text
sentence["World"] = "Abdullah"
puts sentence

# D. Put your name between quotes , print the text
sentence["Abdullah"] = "\"Abdullah\""
puts sentence

# F. Insert a “,” after the word “Ruby”, print the text
sentence = sentence.insert(15, ",")
puts sentence

# G. Insert a tab after the coma, print the text
sentence = sentence.insert(16, "\t")
puts sentence

# H. Count the number of characters, print the count
puts sentence.length

# I. Count number of spaces, print the count
puts sentence.count(' ')

# J. Replace the text spaces by “-”, print the text
sentence = sentence.gsub(' ', '-')
puts sentence
