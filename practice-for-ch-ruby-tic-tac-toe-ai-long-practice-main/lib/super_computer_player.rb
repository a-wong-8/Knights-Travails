require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    current_state = TicTacToeNode.new(game.board ,mark)
    childrens = current_state.children

    winners = childrens.select {|child| child.winning_node?(mark)}

    if !winners.empty?
      winner = winners.sample
      return winner.prev_move_pos
    end

    drawers = childrens.select {|child| !child.losing_node?(mark)}

    if drawers.empty?
      raise RuntimeError
    end

    drawer = drawers.sample
    return drawer.prev_move_pos
  end
end

if $PROGRAM_NAME == __FILE__
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end