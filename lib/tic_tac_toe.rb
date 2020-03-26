class TicTacToe
  def initialize(board = nil)
    @board= board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], # Row wins
                      [0,3,6], [1,4,7], [2,5,8], # Col wins
                      [0,4,8], [2,4,6]] # Diagonal wins

  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index
    @board.index_to.i -= 1
    return @board.index
  end

  def move
    @board.input_to_index
    @board.turn
  end

  def position_taken?
    if (@board.input_to_index != " " || @board.input_to_index != "" || @board.input_to_index != nil)
      return false
    else
      return true
    end
  end

  def valid_move?
    if (position_taken? == false && @board.input_to_index.between?(0,8) == true)
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9: "
    input = gets.strip
    index = input_to_index(input)

    if (valid_move?)
      @board.move
      @board.display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |ttt_win|
      win_1 = WIN_COMBINATIONS[0]
      win_2 = WIN_COMBINATIONS[1]
      win_3 = WIN_COMBINATIONS[2]

      position_1 = @board[win_1]
      position_2 = @board[win_2]
      position_3 = @board[win_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        return ttt_win
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return ttt_win
      end
    end
  #else
  return false
  end

  def full?
    @board.all?{|square| square == "X" || square == "O"}
  end

  def draw?
    if (full? && !won?)
      return true
    else
      return false
    end
  end

  def over?
    if (won? || draw?)
      return true
    else
      return false
  end

  def winner
    index = []
    index = won?(@board)

    if (!index)
      return false
    else
      if (@board.index[0] = "X")
        return "X"
      else
        return "O"
      end
    end
  end

  def play
    while (!over?)
      turn
    end

    if (won?)
      puts "Contratulations player #{winner}!"
    elsif (draw?)
      puts "Cat's Eye!"
    end
  end

end
