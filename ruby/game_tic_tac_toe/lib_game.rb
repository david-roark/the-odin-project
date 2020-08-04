class Player
  attr_accessor :name_player
  attr_reader :chose

  @@arr = {
    '1a' => ' ', '1b' => ' ', '1c' => ' ',
    '2a' => ' ', '2b' => ' ', '2c' => ' ',
    '3a' => ' ', '3b' => ' ', '3c' => ' '
  }

  def initialize(name_player)
    @name_player = name_player
    @chose = []
  end

  def self.exist_position?(choose)
    @@arr.has_key?(choose) && @@arr[choose] == ' ' ? true : false
  end

  def win?
    win = [%w[1a 2a 3a], %w[1b 2b 3b], %w[1c 2c 3c], %w[1a 1b 1c], %w[2a 2b 2c], %w[3a 3b 3c], %w[1a 2b 3c], %w[1c 2b 3a]]
    win - chose.sort.combination(3).to_a != win
  end
end

class PlayerOne < Player
  def position(choose)
    @chose << choose
    @@arr[choose] = 'X'
  end
end

class PlayerTwo < Player
  def position(choose)
    @chose << choose
    @@arr[choose] = 'O'
  end
end

class GameBoard < Player
  def self.arr
    @@arr
  end
end
