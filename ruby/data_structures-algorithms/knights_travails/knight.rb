# frozen_string_literal: true

# knight
class Knight
  attr_reader :position, :pre_position

  def initialize(position, pre_position = nil)
    @position = position
    @pre_position = pre_position
  end
end

# knight moving class
class KnightMoving
  TRANSFORMATIONS = [[1, 2], [2, 1], [-1, -2], [-2, -1], [-1, 2], [2, -1], [1, -2], [-2, 1]].freeze
  @@position_visited = []

  def self.knight_moves(start_position, target_position)
    raise ArgumentError unless valid?(start_position) && valid?(target_position)

    @@position_visited << start_position
    target = nil
    list_next_knights = [Knight.new(start_position)]

    until target
      list_next_knights = list_next_knights.flat_map do |k|
        target = k if k.position == target_position
        next_knights(k)
      end
    end

    build_path(target)
  end

  def self.next_knights(knight)
    next_knights = []

    TRANSFORMATIONS.each do |x, y|
      position = [x + knight.position[0], y + knight.position[1]]

      next unless valid?(position)
      next if @@position_visited.include?(position)

      @@position_visited << position
      next_knights << Knight.new(position, knight)
    end

    next_knights
  end

  def self.valid?(position)
    position.size == 2 && position[0].between?(1, 8) && position[1].between?(1, 8)
  end

  def self.build_path(knight)
    result = []

    until knight.pre_position.nil?
      result.unshift(knight.position)
      knight = knight.pre_position
    end

    result.unshift(knight.position)

    puts "You made it in #{result.size - 1} moves!  Here's your path:"
    result.each { |e| puts e.to_s }
  end
end

KnightMoving.knight_moves([3, 3], [4, 3])
