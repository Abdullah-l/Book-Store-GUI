require './Book'
require './Magazine'

Shoes.app do
  background peru
  @a = []
  @s = stack do
    @b1 = button 'Add store item!'
    @b1.click do
      @a.each { |l| l.remove }
      @r1 = radio('group1')
      @r2 = radio('group1')
      @r1.move(40, 270)
      @p1 = para('Book').move(60, 270)
      @r2.move(120, 270)
      @p2 = para('Magazine').move(140, 270)
      @r1.checked = true
      @line = edit_line 'Enter a StoreItem separated by comma'
      @line.width = 400
      @line.move(30, 300)
      @submitBtn = button 'Submit'
      @submitBtn.move(450, 300)
      @a.push @line, @submitBtn, @r1, @r2, @p1, @p2
      @submitBtn.click do
        if @r1.checked?
          book = Book.addOneItem(@line.text)
          if book.instance_of?(String)
            @line.text = book
          else
            book.writeBookStore
            @a.each { |l| l.remove }
            @a.push para 'Book added successfully!'
          end
        elsif @r2.checked?
          magazine = Magazine.addOneItem(@line.text)
          if magazine.instance_of?(String)
            @line.text = magazine
          else
            magazine.writeMagazineStore
            @a.each { |l| l.remove }
            @a.push para 'Magazine added successfully!'
          end
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
      @lowerP = edit_line 'Lower Price'
      @lowerP.width = 200
      @lowerP.move(30, 300)
      @upperP = edit_line 'Upper Price'
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
    @b4.click do
      @a.each { |l| l.remove }
      @dateLine = edit_line 'Enter a date dd-mm-yyyy'
      @dateLine.width = 400
      @dateLine.move(30, 300)
      @submitBtn = button 'Submit'
      @submitBtn.move(450, 300)
      @a.push @dateLine, @submitBtn
      @submitBtn.click do
        magazineStr = Magazine.getMagazineByDate(@dateLine.text)
        @a.each { |l| l.remove }
        @a.push para magazineStr
      end
    end

    @b5 = button 'Search magazine by publisher'
    @b5.click do
      @a.each { |l| l.remove }
      @dateLine = edit_line 'Enter a publisher\'s name'
      @dateLine.width = 400
      @dateLine.move(30, 300)
      @submitBtn = button 'Submit'
      @submitBtn.move(450, 300)
      @a.push @dateLine, @submitBtn
      @submitBtn.click do
        magazineStr = Magazine.getMagazineByPublisher(@dateLine.text)
        @a.each { |l| l.remove }
        @a.push para magazineStr
      end
    end

    @b6 = button 'List of all store items'
    @b6.click do
      @a.each { |l| l.remove }
      @a.push para Book.getItems
      @a.push para "\n"
      @a.push para Magazine.getItems
    end

    @b6 = button 'Delete an item'
    @b6.click do
      @a.each { |l| l.remove }
      @deleteTitle = edit_line 'Enter the title of the item you want to delete'
      @deleteTitle.width = 400
      @deleteTitle.move(30, 300)
      @submitBtn = button 'Submit'
      @submitBtn.move(450, 300)
      @a.push @deleteTitle, @submitBtn
      @submitBtn.click do
        bookDeleteStatus = Book.deleteItem(@deleteTitle.text)
        if bookDeleteStatus.instance_of?(String)
          @deleteTitle.text = bookDeleteStatus
        else
          magazineDeleteStatus = Magazine.deleteItem(@deleteTitle.text)
          if magazineDeleteStatus.instance_of?(String)
            @deleteTitle.text = magazineDeleteStatus
          else
            @deleteTitle.text = 'Title was not found'
          end
        end
      end
    end
  end
end
