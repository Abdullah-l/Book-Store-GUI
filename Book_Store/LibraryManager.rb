require './Book'

Shoes.app do
  @s = stack do
    background peru
    @b1 = button 'Add store item!'
    # @b1.click {}
    @b2 = button 'List most expensive items'
    @b3 = button 'List books within certain range'
    @b4 = button 'Search magazine by date'
    @b5 = button 'Search magazine by publisher'
    @b6 = button 'List of all store items'
    @b6.click {para Book.getBooks}
    @b6 = button 'Delete an item'


    # @p3.style stroke: red
    # @line.stroke = red 
  end
end
