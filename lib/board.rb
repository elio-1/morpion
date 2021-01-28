class Game
  attr_reader :board
# create an array of rows and colums
  def initialize
    @board = Array.new(3) { Array.new(3) }
  end
  # fil board
  def new_board
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  #assign a spot to  a board position
  def get_spot(choice)
    spot = { '1' => [0, 0],
             '2' => [0, 1],
             '3' => [0, 2],
             '4' => [1, 0],
             '5' => [1, 1],
             '6' => [1, 2],
             '7' => [2, 0],
             '8' => [2, 1],
             '9' => [2, 2] }
    return spot[choice]
  end
  # replace the number in the array with player symbol
  def update_board(spot, symbol)
    @board[spot[0]][spot[1]] = symbol
  end

  def win? #return true if someone won
    # Test rows
    return true if @board[0][0] == @board[0][1] && @board[0][1] == @board[0][2]
    return true if @board[1][0] == @board[1][1] && @board[1][1] == @board[1][2]
    return true if @board[2][0] == @board[2][1] && @board[2][1] == @board[2][2]
    # Test columns
    return true if @board[0][0] == @board[1][0] && @board[1][0] == @board[2][0]
    return true if @board[0][1] == @board[1][1] && @board[1][1] == @board[2][1]
    return true if @board[0][2] == @board[1][2] && @board[1][2] == @board[2][2]
    # Test diagonals
    return true if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]
    return true if @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0]
    false
  end

  def draw?  # Return true if no one won and if the board is full
    return true if !win? && board_full?

    false
  end
 
  def board_full?
    return false if @board.flatten.any?(Numeric) 
    true #return true if all spot are taken by 'x' or 'o'
  end
end
