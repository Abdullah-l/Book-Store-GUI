require './StoreItem'
require 'csv'
require 'date'
class Magazine < StoreItem
  attr_accessor :title, :price, :publisherAgent, :date

  def initialize(title, price, publisherAgent, date)
    super(title, price)
    @publisherAgent = publisherAgent
    @date = date
  end

  # Takes a comma separated string
  # Returns a magazine item
  def self.addOneItem(magazineStr)
    parsedLine = CSV.parse_line(magazineStr)
    return 'Missing magazine info, check your inputs' if parsedLine.count < 4
    # error checking
    # price = Float, date check
    return 'Invalid magazine price, check your inputs' if Float(parsedLine[1], exception: false).nil?

    begin
      date = Date.strptime(parsedLine[3], '%d-%m-%Y')
    rescue StandardError
      return 'Invalid magazine date, check your inputs'
    end

    # return magazine item
    Magazine.new(parsedLine[0], parsedLine[1].to_f, parsedLine[2], parsedLine[3])
  end

  # Gets all current items in Magazine.txt
  # Returns an array of Magazine Objects
  def writeMagazineStore
    magazinesStr = "#{@title},#{@price},#{@publisherAgent},#{@date}\n"
    File.write('Magazine.txt', magazinesStr, mode: 'a')
    'success'
  end

  # Gets all current items in Magazine.txt
  # Returns an array of Magazine Objects
  def self.readItemStore
    magazines = []
    File.open('Magazine.txt', 'r').each_with_index do |line, index|
      next if index == 0

      parsedLine = CSV.parse_line(line)
      # error checking
      # price = Float
      if Float(parsedLine[1], exception: false).nil?
        next # skip
      end

      begin
        date = Date.strptime(parsedLine[3], '%d-%m-%Y')
      rescue StandardError
        return 'Invalid magazine date, check your inputs'
      end

      # add Magazine object to magazines array
      magazines.push Magazine.new(parsedLine[0], parsedLine[1].to_f, parsedLine[2], parsedLine[3])
    end
    magazines
  end

  # Returns magazines as a string
  def self.getItems
    magazinesStr = "title, price, publisher-agent, date\n"
    Magazine.readItemStore.each do |magazine|
      magazinesStr += "#{magazine.title},#{magazine.price},#{magazine.publisherAgent},#{magazine.date}\n"
    end
    magazinesStr
  end

  # Returns all magazines that are published within the given date
  def self.getMagazineByDate(dateStr)
    begin
      Date.strptime(dateStr, '%d-%m-%Y')
    rescue StandardError
      return 'Invalid magazine date, check your inputs'
    end
    magazinesStr = "title, price, publisher-agent, date\n"
    magazines = []

    Magazine.readItemStore.each do |magazine|
      magazines.push(magazine) if magazine.date == dateStr
    end
    magazines.each do |magazine|
      magazinesStr += "#{magazine.title},#{magazine.price},#{magazine.publisherAgent},#{magazine.date}\n"
    end
    return 'No magazine was found' if magazines.count == 0

    magazinesStr
  end

  # Returns all magazines that are published by the given publisher name
  def self.getMagazineByPublisher(publisherStr)
    magazinesStr = "title, price, publisher-agent, date\n"
    magazines = []

    Magazine.readItemStore.each do |magazine|
      magazines.push(magazine) if magazine.publisherAgent == publisherStr
    end
    magazines.each do |magazine|
      magazinesStr += "#{magazine.title},#{magazine.price},#{magazine.publisherAgent},#{magazine.date}\n"
    end
    return 'No magazine was found' if magazines.count == 0

    magazinesStr
  end

  def self.deleteItem(title)
    foundItem = false
    magazineHeaders = "title, price, publisher-agent, date\n"
    magazines = []
    Magazine.readItemStore.each do |magazine|
      if magazine.title == title
        foundItem = true
        next
      else
        magazines.push magazine
      end
    end

    if foundItem
      File.write('Magazine.txt', magazineHeaders, mode: 'w')
      magazines.each do |magazine|
        magazine.writeMagazineStore
      end
      return "Magazine \"#{title}\" successfully deleted"
    end
    false
  end
end
