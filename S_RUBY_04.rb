# A. Write a Ruby program for each of the following to get it out of an array of integers.
# ex:[1,2,3,4,5]
# a. Max #=> 5
# b. Min #=> 1
# c. Count #=>5
# d. Sum #=> 15
# e. Multiplication of all elements #=> 120
def exerciseA(arr)
  puts arr.max
  puts arr.min
  puts arr.count
  puts arr.sum
  puts arr.inject(:*)
end

# B. Write a Ruby program to check whether a value exists in an array using array APIs.
def exerciseB(arr, value)
  if arr.index(value).nil?
    puts "Value doesn't exist"
  else
    puts 'Value exists'
  end
end

# C. Write a ruby program that gets the count of each element in the array.ex: if
# a=[1,1,2,2,3,3,3] the output will be result=[[1,2],[2,2],[3,3]]
def exerciseC(arr)
  count = Hash.new 0
  arr.each do |el|
    count[el] += 1
  end
  p count.to_a
end

# D. Write two Ruby programs to compute the sum of elements in a given array of integers
# using iterators/reducers
def exerciseD1(arr)
  puts arr.reduce(0, :+)
end

def exerciseD2(arr)
  sum = 0
  arr.each do |el|
    sum += el
  end
  puts sum
end

# E. Write a Ruby program to remove duplicate elements from a given array using array
# APIs.
def exerciseE(arr)
  p arr.uniq
end

# F. Write a Ruby program to create a new array of length 2 containing the middle two
# elements from a given array of integers of even length 2 or more using arrays APIs
def exerciseF(arr)
  arrSize = arr.size
  p [arr[arrSize / 2 - 1], arr[arrSize / 2]] if arrSize >= 2 && arrSize.even?
end

# G. Write a Ruby program to find the largest value from a given array of integers of odd
# length. The array length will be a least 1 using array APIs.
def exerciseG(arr)
  puts arr.select { |el| el.odd? }.max
end

# H. Write a Ruby program to compute the sum of the numbers of a given array except the
# number 17 and numbers that come immediately after a 17. Return 0 for an empty array
# using array APIs.
def exerciseH(arr)
  return 0 if arr.size == 0

  sum = 0
  arr.each do |el|
    break if el == 17

    sum += el
  end
  puts sum
end

# I. Write a Ruby program to check whether all items are identical in a given array using
# array APIs.
def exerciseI(arr)
  if arr.uniq.size == 1
    puts 'All items are identical'
  else
    puts 'Items are not identical'
  end
end

# J. Given an input text output it transposed.
# Roughly explained, the transpose of a matrix:
# ABC
# DEF
# is given by:
# AD
# BE
# CF
def exerciseJ(text)
  s = text.split("\n")
  transposedText = ''
  i = 0
  while true
    row = ''
    s.each do |char|
      row += (char[i] or ' ')
    end
    break if row.strip == ''

    transposedText += row + "\n"
    i += 1
  end
  puts transposedText
end

# Driver Code
exerciseA([1, 2, 3, 4, 5])

exerciseB([1, 2, 3, 4, 5], 3)
exerciseB([1, 2, 3, 4, 5], 4478)

exerciseC([1, 1, 2, 2, 3, 3, 3])

exerciseD1([1, 2, 3, 4, 5])
exerciseD2([1, 2, 3, 4, 5])

exerciseE([1, 1, 2, 2, 3, 3, 3])
exerciseE([1, 1, 2, 2, 3, 3, 3, 4])

exerciseF([1, 2, 3, 4, 5, 6, 7, 8])
exerciseF([1, 2, 3, 4])
exerciseF([1, 2])
exerciseF([1, 2, 3])

exerciseG([1, 2, 3])
exerciseG([8, 7, 13, 9])
exerciseG([6, 2, 28, 16])

exerciseH([5, 2, 8, 17, 19, 5])
exerciseH([])
exerciseH([17])
exerciseH([16])

exerciseI([5, 2, 8, 17, 19, 5])
exerciseI([5, 5, 5, 5, 5, 5, 5, 5])

exerciseJ("ABC\nDEF")
