require './StoreItem'
class Magazine < StoreItem

    def initialize(title, price,publisherAgent,date)
        super(title, price)
        @publisherAgent = publisherAgent
        @date = date
    end

end

# item1 = Book.new("Ruby Cookbook",100.3,"Lucas Carlson",400 ,"9780596523695")
# p Book.superclass