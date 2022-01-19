require './StoreItem'
class Book < StoreItem
  @books = []
  attr_accessor :title, :price, :authorName, :numberOfPages, :isbn
  def initialize(title, price, authorName, numberOfPages, isbn)
    super(title, price)
    @authorName = authorName
    @numberOfPages = numberOfPages
    @isbn = isbn
  end

  def self.readStore
    File.foreach('Book.txt') do |line|
      parsedLine = CSV.parse_line(line)
      @books.push Book.new(parsedLine[0], parsedLine[1], parsedLine[2], parsedLine[3], parsedLine[4])
    end
    @books
  end

  def self.getBooks
    res = ""
    for book in Book.readStore
        res += "#{book.price}\n"
    end
    return res
  end
end

p Book.getBooks
