
class GameBoard

  @@BOARD = {
    '1a' => ' ', '1b' => ' ', '1c' => ' ',
    '2a' => ' ', '2b' => ' ', '2c' => ' ',
    '3a' => ' ', '3b' => ' ', '3c' => ' '
  }

  def self.game_board
    puts '   a b c'
    puts '  -------'
    print "1 |#{@@BOARD['1a']}|#{@@BOARD['1b']}|#{@@BOARD['1c']}|\n"
    puts '  -------'
    print "2 |#{@@BOARD['2a']}|#{@@BOARD['2b']}|#{@@BOARD['2c']}|\n"
    puts '  -------'
    print "3 |#{@@BOARD['3a']}|#{@@BOARD['3b']}|#{@@BOARD['3c']}|\n"
    puts '  -------'
  end

end

class Player < GameBoard
  attr_accessor :name_player

  def initialize(name_player, mark)
    @name_player = name_player
    @mark = mark
    @chose = []
  end

  def self.exist_position?(choose)
    @@BOARD.has_key?(choose) && @@BOARD[choose] == ' ' ? true : false
  end

  def win?
    win = [
      %w[1a 2a 3a], %w[1b 2b 3b], %w[1c 2c 3c],
      %w[1a 1b 1c], %w[2a 2b 2c], %w[3a 3b 3c],
      %w[1a 2b 3c], %w[1c 2b 3a]
    ]
    win - @chose.sort.combination(3).to_a != win
  end

  def tick(choose)
    @@BOARD[choose] = @mark
    @chose << choose
    self
  end

  def win_board
    @@BOARD.transform_values! { |v| v == @mark ? v : ' '}
  end
end
