require_relative 'cons'
require_relative 'board'

class Piece
  attr_accessor :x, :y, :name
  attr_reader :team

  def initialize(x, y, team = :b)
    @x = x
    @y = y
    @team = team
    @name = "#{team}#{self.class}"
  end

  def show
    PIECES_SYMBOL[@name]
  end

  def position
    "#{@x}#{@y}"
  end
end

class Rook < Piece
  def path_to(pos)
    x = pos[0].to_i - @x
    y = pos[1].to_i - @y
    return [] unless x * y == 0

    path = []
    if x == 0
      y.abs.times { |i| path << [0, y.abs / y * (i + 1)] }
    else
      x.abs.times { |i| path << [x.abs / x * (i + 1), 0] }
    end

    path.map { |a, b| "#{@x + a}#{@y + b}" }
  end
end

class Knight < Piece
  def path_to(pos)
    x = pos[0].to_i - @x
    y = pos[1].to_i - @y

    (x * y).abs == 2 ? [pos] : []
  end
end

class Bishop < Piece
  def path_to(pos)
    x = pos[0].to_i - @x
    y = pos[1].to_i - @y
    path = []

    if x.abs == y.abs
      x.abs.times do |i|
        path << [x.abs / x * (i + 1), y.abs / y * (i + 1)]
      end
    end

    path.map { |a, b| "#{@x + a}#{@y + b}" }
  end
end

class Queen < Piece
  def path_to(pos)
    x = pos[0].to_i - @x
    y = pos[1].to_i - @y

    path = []

    if x == 0
      y.abs.times { |i| path << [0, y.abs / y * (i + 1)] }
    elsif y == 0
      x.abs.times { |i| path << [x.abs / x * (i + 1), 0] }
    elsif x.abs == y.abs
      x.abs.times { |i| path << [x.abs / x * (i + 1), y.abs / y * (i + 1)] }
    else
      return []
    end

    path.map { |a, b| "#{@x + a}#{@y + b}" }
  end
end

class King < Piece
  def path_to(pos)
    ((pos[0].to_i - @x) * (pos[1].to_i - @y)).abs <= 1 ? [pos] : []
  end
end

class Pawn < Piece
  attr_accessor :first_time

  def initialize(*)
    super
    @first_time = true
  end

  def path_to(pos)
    x = pos[0].to_i - @x
    y = pos[1].to_i - @y
    path = []
    alpha = team == :b ? 1 : -1

    if @first_time && x == (2 * alpha) && y == 0
      path = [[1 * alpha, 0], [2 * alpha, 0]]
    elsif x == (1 * alpha) && (y == 0 || y.abs == 1)
      path = [[1 * alpha, y]]
    else
      return []
    end

    path.map { |a, b| "#{@x + a}#{@y + b}" }
  end
end
