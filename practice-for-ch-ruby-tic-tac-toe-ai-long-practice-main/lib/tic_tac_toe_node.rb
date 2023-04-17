require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.over?
      if (board.winner == :x && evaluator == :o) || (board.winner == :o && evaluator == :x)
        return true
      else
        return false
      end
    end

    if @next_mover_mark == evaluator
      self.children.all? {|child| child.losing_node?(evaluator)}
    else 
      self.children.any? {|child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    if board.over?
      if board.winner == evaluator
        return true
      else
        return false
      end
    end

    if @next_mover_mark == evaluator
      self.children.any? {|child| child.winning_node?(evaluator)}
    else 
      self.children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    childrens = []

    @board.open_positions.each do |pos|
      board_copy = board.dup
      board_copy[pos] = @next_mover_mark

      if @next_mover_mark == :o
        childrens << TicTacToeNode.new(board_copy, :x, pos)
      else
        childrens << TicTacToeNode.new(board_copy, :o, pos)
      end
    end
    return childrens
  end
end