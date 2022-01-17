require 'test/unit'

# A. Write a Ruby program to check three given integers (a:smallest,b,c:largest) and return
# true if the three values are equally spaced, so the difference between a and b is the
# same as the difference between b and c.
def exerciseA(a, b, c)
  (((a - b) <=> (b - c)) == 0)
end

# B. Write a Ruby program to check three given integers a, b, c and return true if one of b or c
# is close (difference out of a by at most 1), while the other is far, difference from both
# other values by 3 or more.
def problemThatGaveMeAStrokeTryingToReadIt(a, b, c)
  ((a - b).abs <= 1 && (a - c).abs >= 3 && (b - c).abs >= 3) || ((a - c).abs <= 1 && (a - b).abs >= 3 && (b - c).abs >= 3)
end

# C. Write a Ruby program to check two given integers, each in the range 10..99, return true
# if there is a digit that appears in both numbers.
def exerciseC(a, b)
  i = 0
  while i < 2
    return true if a.to_s[i] == b.to_s[0] || a.to_s[i] == b.to_s[1]

    i += 1
  end
  false
end

# D. Write a Ruby program to check two given integers and return true if either one is 11 or
# their sum or difference is 11 otherwise return false.
def exerciseD(a, b)
  if a == 11 || b == 11
    return true
  elsif (a + b) == 11 || (a - b) == 11 || (b - a) == 11
    return true
  end

  false
end

# E. Write a Ruby program to check whether 2 strings start and end with
# different letters and both of them doesn’t include letter “x”.
def exerciseE(a, b)
  (a[0] != b[0] && a[a.length - 1] != b[b.length - 1] && a.index('x').nil? && b.index('x').nil?)
end

# F. Write a Ruby program that checks whether a string contains a vowel.
def exerciseF(a)
  a.scan(/[aeiou]/i).count > 0
end

# G. Write a Ruby program that keeps getting an integer at the console less than 100 score
# from the user, and exists when he inserts -1.
# If he inserted a number out of range, print the message :”Please insert a score from 0 to
# 100”.
# Your program shall print out the corresponding evaluation as follows:
# 0-49:fail.
# 50-60:pass
# 60-70:good
# 70-80:very good
# 80-90:excellent
# 90-100:incredible
def exerciseG
  while true
    print 'Exercise G, Enter a score from 0 to 100: '
    score = gets.chomp.to_f
    if score >= 0 && score < 50
      puts 'Fail'
    elsif score >= 50 && score < 60
      puts 'Pass'
    elsif score >= 60 && score < 70
      puts 'Good'
    elsif score >= 70 && score < 80
      puts 'Very Good'
    elsif score >= 80 && score < 90
      puts 'Excellent'
    elsif score >= 90 && score <= 100
      puts 'Incredible'
    elsif score == -1
      break
    else
      puts 'Please insert a score from 0 to 100'
    end
  end
end

exerciseG

######################## Unit Tests ########################

class TestsA < Test::Unit::TestCase
  def test1
    assert_true exerciseA(3, 2, 1) # true
  end

  def test2
    assert_false exerciseA(3, 2, 2) # false
  end

  def test3
    assert_true exerciseA(3, 5, 7) # true
  end
end

class TestsB < Test::Unit::TestCase
  def test1
    assert_true problemThatGaveMeAStrokeTryingToReadIt(5, 5.5, 33) # true
  end

  def test2
    assert_true problemThatGaveMeAStrokeTryingToReadIt(5, 6, 33) # true
  end

  def test3
    assert_true problemThatGaveMeAStrokeTryingToReadIt(5, 33, 5) # true
  end

  def test4
    assert_false problemThatGaveMeAStrokeTryingToReadIt(5, 5.5, 6) # false
  end

  def test5
    assert_false problemThatGaveMeAStrokeTryingToReadIt(5, 5.5, 7) # false
  end

  def test6
    assert_true problemThatGaveMeAStrokeTryingToReadIt(8, 7, 33) # true
  end

  def test7
    assert_true problemThatGaveMeAStrokeTryingToReadIt(8, 33, 7) # true
  end

  def test8
    assert_false problemThatGaveMeAStrokeTryingToReadIt(8, 7, 7) # false
  end

  def test9
    assert_false problemThatGaveMeAStrokeTryingToReadIt(8, 7, 10) # false
  end

  def test10
    assert_false problemThatGaveMeAStrokeTryingToReadIt(8, 9, 11) # false
  end

  def test11
    assert_true problemThatGaveMeAStrokeTryingToReadIt(8, 9, 12) # true
  end

  def test12
    assert_true problemThatGaveMeAStrokeTryingToReadIt(8, 7, 11) # true
  end
end

class TestsC < Test::Unit::TestCase
  def test1
    assert_true exerciseC(83, 28) # true
  end

  def test2
    assert_false exerciseC(83, 20) # false
  end

  def test3
    assert_true exerciseC(83, 32) # true
  end

  def test4
    assert_true exerciseC(83, 23) # true
  end
end

class TestsD < Test::Unit::TestCase
  def test1
    assert_true exerciseD(4, 7) # true
  end

  def test2
    assert_true exerciseD(18, 7) # true
  end

  def test3
    assert_true exerciseD(7, 18) # true
  end

  def test4
    assert_true exerciseD(4, 11) # true
  end

  def test5
    assert_true exerciseD(11, 11) # true
  end

  def test6
    assert_false exerciseD(23, 8) # false
  end

  def test7
    assert_false exerciseD(2, 12) # false
  end
end

class TestsE < Test::Unit::TestCase
  def test1
    assert_true exerciseE('dedjsfn', 'fhdsind') # true
  end

  def test2
    assert_false exerciseE('dedjsfn', 'fhdxind') # false
  end

  def test3
    assert_false exerciseE('dedjsfn', 'dhdsink') # false
  end

  def test4
    assert_true exerciseE('dd', 'nn') # true
  end
end

class TestsF < Test::Unit::TestCase
  def test1
    assert_true exerciseF('hello')
  end

  def test2
    assert_true exerciseF('HELLO')
  end

  def test3
    assert_false exerciseF('rkd')
  end

  def test4
    assert_false exerciseF('RKD')
  end

  def test5
    assert_true exerciseF('i have vowEls')
  end
end

# NOTE: No tests for exercise G because it gets user input
