# A. For the following hash:
Employees = { 10 => { 'name' => 'Ahmed', 'salary' => 1000 },
              21 => { 'name' => 'Mohamed', 'salary' => 2000 },
              113 => { 'name' => 'Mahmoud', 'salary' => 5000 },
              4 => { 'name' => 'Yassin', 'salary' => 3000 },
              52 => { 'name' => 'Taha', 'salary' => 4000 },
              102 => { 'name' => 'Khadija', 'salary' => nil },
              64 => { 'name' => 'Sara', 'salary' => 5000 },
              37 => { 'name' => 'Nadine', 'salary' => 5000 },
              88 => { 'name' => 'Doaa', 'salary' => 4000 },
              90 => { 'name' => 'Iman', 'salary' => 4000 },
              103 => { 'name' => 'Khadija', 'salary' => 1000 },
              12 => { 'name' => 'Kholod', 'salary' => nil },
              15 => { 'name' => 'Said', 'salary' => nil },
              38 => { 'name' => 'Nadine', 'salary' => 5000 },
              89 => { 'name' => 'Doaa', 'salary' => 4000 },
              91 => { 'name' => 'Iman', 'salary' => 4000 },
              104 => { 'name' => 'Khadija', 'salary' => 1000 },
              17 => { 'name' => 'Kholod', 'salary' => nil },
              14 => { 'name' => 'Said', 'salary' => nil } }
# Write a program for each of the following that
# I. Gets all employees name
def exerciseI
  Employees.values.each do |el|
    puts el['name']
  end
end
exerciseI
# II. Gets all employee IDs ex:[10,21,113,...]
def exerciseII
  puts Employees.keys
end
exerciseII
# III. Gets employees with the highest salary in an array along their ID
# ex::[{name:”Mahmoud”,salary:5000,id:113},{name:”Sara”,salary:5000,id:64},...]
def exerciseIII
  curHighestSalary = 0
  highestSalariesArr = []
  Employees.each do |key, value|
    next if value['salary'].nil?

    if value['salary'] > curHighestSalary
      curHighestSalary = value['salary']
      highestSalariesArr = []
      empInfo = value.clone
      empInfo['id'] = key
      highestSalariesArr.push(empInfo)
    elsif value['salary'] == curHighestSalary
      empInfo = value.clone
      empInfo['id'] = key
      highestSalariesArr.push(empInfo)
    end
  end
  p highestSalariesArr
end
exerciseIII
# IV. Gets employees with lowest salary in a hash keeping their IDs
# Ex:{
# 10:{name:”Ahmed”,salary:1000},
# 103:{name:”Khadija”,salary:1000},
# ….
# }
def exerciseIV
  curLowestSalary = 1_000_000
  lowestSalaries = {}
  Employees.each do |key, value|
    next if value['salary'].nil?

    if value['salary'] < curLowestSalary
      curLowestSalary = value['salary']
      lowestSalaries = {}
      lowestSalaries[key] = value
    elsif value['salary'] == curLowestSalary
      lowestSalaries[key] = value
    end
  end
  p lowestSalaries
end
exerciseIV

# V. Gets average salaries
def exerciseV
  numOfSalaries = 0.0
  totalSalaries = 0.0
  avgSalaries = 0.0
  Employees.each do |_key, value|
    next if value['salary'].nil?

    numOfSalaries += 1
    totalSalaries += value['salary']
  end
  avgSalaries = totalSalaries / numOfSalaries
  p avgSalaries.round(3)
end
exerciseV

# VI. Remove employees with nil salary.
def exerciseVI
  employeesCopy = Employees.clone
  Employees.each do |key, value|
    employeesCopy.delete(key) if value['salary'].nil?
  end
  # p employeesCopy
end
exerciseVI
# VII. Gets hash a new hash with uniq employees (remove duplicate)
def exerciseVII
  employeesCopy = Employees.clone
  names = []
  Employees.each do |key, value|
    # next if value['salary'].nil?
    if names.index(value['name']).nil?
      names.push(value['name'])
    else
      employeesCopy.delete(key)
    end
  end
  # p employeesCopy
end
exerciseVII

# B. Write a Ruby program to find most occurred item in a given array along the elements
# frequency:
# ex:Original array:
# [10, 20, 30, 40, 10, 10, 20]
# Frequency of numbers:
# {10=>3, 20=>2, 30=>1, 40=>1}
def exerciseB(arr)
  count = Hash.new 0
  arr.each do |el|
    count[el] += 1
  end
  p count
end
exerciseB([10, 20, 30, 40, 10, 10, 20])
