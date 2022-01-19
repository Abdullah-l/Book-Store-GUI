require './StoreItem'
require 'csv'
class Book < StoreItem
  attr_accessor :title, :price, :authorName, :numberOfPages, :isbn

  def initialize(title, price, authorName, numberOfPages, isbn)
    super(title, price)
    @authorName = authorName
    @numberOfPages = numberOfPages
    @isbn = isbn
  end

  # Takes a comma separated string
  # Returns a book item
  def self.addOneItem(bookStr)
    parsedLine = CSV.parse_line(bookStr)
    return 'Missing book info, check your inputs' if parsedLine.count < 5
    # error checking
    # price = Float, numberOfPages = Integer, isbn = Integer
    if Float(parsedLine[1], exception: false).nil? || Integer(parsedLine[3],
                                                              exception: false).nil? || Integer(parsedLine[4],
                                                                                                exception: false).nil?
      return 'Invalid book info, check your inputs'
    end

    # return book item
    Book.new(parsedLine[0], parsedLine[1].to_f, parsedLine[2], parsedLine[3].to_i, parsedLine[4])
  end

  # Gets all current items in Book.txt
  # Returns an array of Book Objects
  def writeBookStore
    booksStr = "#{@title},#{@price},#{@authorName},#{@numberOfPages},#{@isbn}\n"
    File.write('Book.txt', booksStr, mode: 'a')
    'success'
  end

  # Gets all current items in Book.txt
  # Returns an array of Book Objects
  def self.readItemStore
    books = []
    File.open('Book.txt', 'r').each_with_index do |line, index|
      next if index == 0

      parsedLine = CSV.parse_line(line)
      # error checking
      # price = Float, numberOfPages = Integer, isbn = Integer
      if Float(parsedLine[1], exception: false).nil? || Integer(parsedLine[3],
                                                                exception: false).nil? || Integer(parsedLine[4],
                                                                                                  exception: false).nil?
        next # skip
      end

      # add Book object to books array
      books.push Book.new(parsedLine[0], parsedLine[1].to_f, parsedLine[2], parsedLine[3].to_i, parsedLine[4])
    end
    books
  end

  # Returns books as a string
  def self.getItems
    booksStr = "title, price, author name, number of pages, isbn\n"
    Book.readItemStore.each do |book|
      booksStr += "#{book.title},#{book.price},#{book.authorName},#{book.numberOfPages},#{book.isbn}\n"
    end
    booksStr
  end

  # Returns most expensive books as a string
  def self.getHighestPricedBooks
    booksStr = "title, price, author name, number of pages, isbn\n"
    highestPrice = 0
    highestPricedBooks = []
    Book.readItemStore.each do |book|
      if book.price > highestPrice
        highestPrice = book.price
        highestPricedBooks = []
        highestPricedBooks.push(book)
      elsif book.price == highestPrice
        highestPricedBooks.push(book)
      end
    end
    highestPricedBooks.each do |book|
      booksStr += "#{book.title},#{book.price},#{book.authorName},#{book.numberOfPages},#{book.isbn}\n"
    end
    booksStr
  end

  # Returns books within a certain price range as a string
  def self.getBooksWithinRange(lowerPrice, upperPrice)
    # Error Checking
    return 'Invalid input' if Float(lowerPrice, exception: false).nil? || Float(upperPrice, exception: false).nil?

    lowerPrice = lowerPrice.to_f
    upperPrice = upperPrice.to_f

    return 'Invalid price range' if lowerPrice >= upperPrice

    booksStr = "title, price, author name, number of pages, isbn\n"
    Book.readItemStore.each do |book|
      if book.price >= lowerPrice && book.price <= upperPrice
        booksStr += "#{book.title},#{book.price},#{book.authorName},#{book.numberOfPages},#{book.isbn}\n"
      end
    end
    booksStr
  end

  def self.deleteItem(title)
    foundItem = false
    bookHeaders = "title, price, author name, number of pages, isbn\n"
    books = []
    Book.readItemStore.each do |book|
      if book.title == title
        foundItem = true
        next
      else
        books.push book
      end
    end

    if foundItem
      File.write('Book.txt', bookHeaders, mode: 'w')
      books.each do |book|
        book.writeBookStore
      end
      return "Book \"#{title}\" successfully deleted"
    end
    false
  end
end
