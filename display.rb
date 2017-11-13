require 'colorize'
require 'board'
require 'cursor'

class Display
  
  def cursor 
    @cursor = Cursor.new([0,0], board)
  end 
    
end 