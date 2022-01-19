require './StoreItem'
class Book < StoreItem
  attr_accessor :title, :price, :authorName, :numberOfPages, :isbn

  def initialize(title, price, authorName, numberOfPages, isbn)
    super(title, price)
    @authorName = authorName
    @numberOfPages = numberOfPages
    @isbn = isbn
  end

  def self.readStore
    books = []
    File.open('Book.txt', 'r').each_with_index do |line, index|
      next if index == 0

      parsedLine = CSV.parse_line(line)
      # error checking
      # price = Float, numberOfPages = Integer, isbn = Integer
      if Float(parsedLine[1],
               exception: false).nil? || Integer(parsedLine[3],
                                                 exception: false).nil? || Integer(parsedLine[4], exception: false).nil?
        next
      end

      books.push Book.new(parsedLine[0], parsedLine[1].to_f, parsedLine[2], parsedLine[3].to_i, parsedLine[4])
    end
    books
  end

  def self.getBooks
    res = "title, price, author name, number of pages, isbn\n"
    Book.readStore.each do |book|
      res += "#{book.title}, #{book.price}, #{book.authorName}, #{book.numberOfPages}, #{book.isbn}\n"
    end
    res
  end

  def self.getHighestPricedBooks
    res = "title, price, author name, number of pages, isbn\n"
    highestPrice = 0
    highestPricedBooks = []
    Book.readStore.each do |book|
      if book.price > highestPrice
        highestPrice = book.price
        highestPricedBooks = []
        highestPricedBooks.push(book)
      elsif book.price == highestPrice
        highestPricedBooks.push(book)
      end
    end
    highestPricedBooks.each do |book|
      res += "#{book.title}, #{book.price}, #{book.authorName}, #{book.numberOfPages}, #{book.isbn}\n"
    end
    res
  end
end

p Book.getHighestPricedBooks
