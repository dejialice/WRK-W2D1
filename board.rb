require_relative "piece"
require 'byebug'

class NoPieceError < StandardError
  def message
    puts "There is no piece at this start position"
  end
end

class CannotMoveError < StandardError
  def message 
    puts "This piece can't move to that position."
  end 
end 

class Board
  
  def initialize(grid = Array.new(8) { Array.new(8) })
    @grid = grid
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end
  
  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end
     
  def dup()
  end
  
  def move_piece!(start_pos, end_pos)
    if self[start_pos].is_a?(Piece) && self[end_pos].nil?
      self[end_pos] = self[start_pos]
      self[start_pos] = nil 
    elsif self[start_pos].nil?
      raise NoPieceError
    elsif self[end_pos] != nil 
      raise CannotMoveError
    end 
      self
      
  end
  
  def checkmate?
    
  end
  
  def make_starting_grid
    (0..1).each do |row|
      (0..7).each do |col|
        pos = [row, col]
        self[pos] = Piece.new()
      end
    end
    (6..7).each do |row|
      (0..7).each do |col|
        pos = row, col
        self[pos] = Piece.new()
      end
    end
    self  
  end
  
  protected

  
  def find_king(color)
  end
end