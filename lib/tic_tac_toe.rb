class TicTacToe
  def initialize(board = nil)
    @board= board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8] # Row wins
                      [0,3,6], [1,4,7], [2,5,8] # Col wins
                      [0,4,8], [2,4,6]]

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
      win1 = WIN_COMBINATIONS[0]
      win2 = WIN_COMBINATIONS[1]
      win3 = WIN_COMBINATIONS[2]

      win_index1 = @board[win1]
      win_index2 = @board[win2]
      win_index3 = @board[win3]
  end

  def full?

  end

  def draw?

  end

  def over?

  end

  def winner

  end

  def play
    while (!over?)
      turn
    end

    if (won?)
      puts "Contratulations player #{}"
    elsif (draw?)
      puts "Cat's Eye!"
  end

end
