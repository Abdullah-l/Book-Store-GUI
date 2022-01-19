require './Book'

Shoes.app do
  background peru
  @a = []
  @s = stack do
    @b1 = button 'Add store item!'
    @b1.click do
      @a.each { |l| l.remove }
      @line = edit_line 'Enter a StoreItem separated by comma'
      @line.width = 400
      @line.move(30, 300)
      @submitBtn = button 'Submit'
      @submitBtn.move(450, 300)
      @a.push @line, @submitBtn
      @submitBtn.click do
        book = Book.addOneItem(@line.text)
        if book.instance_of?(String)
          @line.text = book
        else
          book.writeBookStore
          @a.each { |l| l.remove }
          @a.push para 'Book added successfully!'
        end
      end
    end

    @b2 = button 'List most expensive books'
    @b2.click do
      @a.each { |l| l.remove }
      @a.push para Book.getHighestPricedBooks
    end
    @b3 = button 'List books within certain price range'
    @b3.click do
      @a.each { |l| l.remove }
      @lowerP = edit_line "Lower Price"
      @lowerP.width = 200
      @lowerP.move(30, 300)
      @upperP = edit_line "Upper Price"
      @upperP.width = 200
      @upperP.move(250, 300)
      @submitPBtn = button 'Submit'
      @submitPBtn.move(480, 300)
      @a.push @lowerP, @upperP, @submitPBtn
      @submitPBtn.click do
        bookStr = Book.getBooksWithinRange(@lowerP.text, @upperP.text)
        @a.each { |l| l.remove }
        @a.push para bookStr
      end
    end
    @b4 = button 'Search magazine by date'
    @b5 = button 'Search magazine by publisher'
    @b6 = button 'List of all store items'
    @b6.click do
      @a.each { |l| l.remove }
      @a.push para Book.getItems
    end
    @b6 = button 'Delete an item'

    # @p3.style stroke: red
    # @line.stroke = red
  end
end
