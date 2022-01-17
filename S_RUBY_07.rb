# For the array arr=[1,2,3,4,5,6,7,8,9,10] , write a ruby program for each of the following using
# once using for ,once using while loop and once using loop.
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# A. Print out the array elements
for el in arr
  print el
end
puts
i = 0
while i < arr.length
  print arr[i]
  i += 1
end
puts
j = 0
loop do
  print arr[j]
  j += 1
  break if j >= arr.length
end
puts

# B. Print out the array elements except 5 and 6
for el in arr
  next if [5, 6].include?(el)

  print el
end
puts
i = 0
while i < arr.length
  if [5, 6].include?(arr[i])
    i += 1
    next
  end
  print arr[i]
  i += 1
end
puts
j = 0
loop do
  if [5, 6].include?(arr[j])
    j += 1
    next
  end
  print arr[j]
  j += 1
  break if j >= arr.length
end
puts

# C. Print out array elements less than 6
for el in arr
  print el if el < 6
end
puts
i = 0
while i < arr.length
  print arr[i] if arr[i] < 6
  i += 1
end
puts
j = 0
loop do
  print arr[j] if arr[j] < 6
  j += 1
  break if j >= arr.length
end
puts

# D. Print out even numbers only
for el in arr
  print el if el.even?
end
puts
i = 0
while i < arr.length
  print arr[i] if arr[i].even?
  i += 1
end
puts
j = 0
loop do
  print arr[j] if arr[j].even?
  j += 1
  break if j >= arr.length
end
puts

# E. Print out odd numbers only
for el in arr
  print el if el.odd?
end
puts
i = 0
while i < arr.length
  print arr[i] if arr[i].odd?
  i += 1
end
puts
j = 0
loop do
  print arr[j] if arr[j].odd?
  j += 1
  break if j >= arr.length
end
puts

# F. Print out numbers from 2 to 9
for el in arr
  print el if el > 2 && el < 9
end
puts
i = 0
while i < arr.length
  print arr[i] if arr[i] > 2 && arr[i] < 9
  i += 1
end
puts
j = 0
loop do
  print arr[j] if arr[j] > 2 && arr[j] < 9
  j += 1
  break if j >= arr.length
end
puts

# G. Print out each number indicating whether it’s even or odd
# Ex: 1 odd
# 2 even
# 3 odd
# 4 even …
for el in arr
  puts "#{el} odd" if el.odd?
  puts "#{el} even" if el.even?
end
puts
i = 0
while i < arr.length
  puts "#{arr[i]} odd" if arr[i].odd?
  puts "#{arr[i]} even" if arr[i].even?
  i += 1
end
puts
j = 0
loop do
  puts "#{arr[j]} odd" if arr[j].odd?
  puts "#{arr[j]} even" if arr[j].even?
  j += 1
  break if j >= arr.length
end
puts
