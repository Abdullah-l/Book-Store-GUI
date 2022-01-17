# For the array arr=[1,2,3,4,5,6,7,8,9,10] , write a ruby program for each of the following using
# once using for ,once using while loop and once using loop.
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# A. Print out the array elements
arr.each do |el|
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
arr.each do |el|
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
# D. Print out even numbers only
# E. Print out odd numbers only
# F. Print out numbers from 2 to 9
# G. Print out each number indicating whether it’s even or odd
# Ex: 1 odd
# 2 even
# 3 odd
# 4 even …
