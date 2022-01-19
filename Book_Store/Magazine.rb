require './StoreItem'
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
    if Float(parsedLine[1], exception: false).nil? 
      return 'Invalid magazine info, check your inputs'
    end

    # return magazine item
    Magazine.new(parsedLine[0], parsedLine[1].to_f, parsedLine[2], parsedLine[3])
  end

  # Gets all current items in Magazine.txt
  # Returns an array of Magazine Objects
  def writeMagazineStore
    magazinesStr = "#{@title}, #{@price}, #{@publisherAgent}, #{@date}}\n"
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
      # price = Float, check date
      if Float(parsedLine[1], exception: false).nil? 
        next # skip
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
      magazinesStr += "#{magazine.title}, #{magazine.price}, #{magazine.publisherAgent}, #{magazine.date}\n"
    end
    magazinesStr
  end

  # Returns most expensive magazines as a string
#   def self.getHighestPricedMagazines
#     magazinesStr = "title, price, publisher-agent, date\n"
#     highestPrice = 0
#     highestPricedMagazines = []
#     Magazine.readItemStore.each do |magazine|
#       if magazine.price > highestPrice
#         highestPrice = magazine.price
#         highestPricedMagazines = []
#         highestPricedMagazines.push(magazine)
#       elsif magazine.price == highestPrice
#         highestPricedMagazines.push(magazine)
#       end
#     end
#     highestPricedMagazines.each do |magazine|
#       magazinesStr += "#{magazine.title}, #{magazine.price}, #{magazine.authorName}, #{magazine.numberOfPages}, #{magazine.isbn}\n"
#     end
#     magazinesStr
#   end

  # Returns magazines within a certain price range as a string
#   def self.getItemsWithinRange(lowerPrice, upperPrice)
#     # Error Checking
#     return 'Invalid input' if Float(lowerPrice, exception: false).nil? || Float(upperPrice, exception: false).nil?

#     lowerPrice = lowerPrice.to_f
#     upperPrice = upperPrice.to_f

#     return 'Invalid price range' if lowerPrice >= upperPrice

#     magazinesStr = "title, price, author name, number of pages, isbn\n"
#     Magazine.readItemStore.each do |magazine|
#       if magazine.price >= lowerPrice && magazine.price <= upperPrice
#         magazinesStr += "#{magazine.title}, #{magazine.price}, #{magazine.authorName}, #{magazine.numberOfPages}, #{magazine.isbn}\n"
#       end
#     end
#     magazinesStr
#   end

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
      return 'Item deleted'
    end
    false
  end
end

# item1 = Magazine.new("Ruby Cookmagazine",100.3,"Lucas Carlson",400 ,"9780596523695")
# p Magazine.superclass
