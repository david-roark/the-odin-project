require_relative 'cons'
require_relative 'pieces'

class Board
  def self.in_board?(pos)
    !!(/^[1-8]{2}$/ =~ pos)
  end

  def initialize
    @board = create_board
  end

  def show
    board = @board.map do |row|
      row.map { |e| e.is_a?(Piece) ? e.show : e }.join(' | ')
    end.join("\n")

    puts board
  end

  def piece_at(pos)
    raise ArgumentError unless Board.in_board?(pos)

    x = pos[0].to_i
    y = pos[1].to_i
    @board[x][y]
  end

  def move(piece, pos)
    return :not_in_board unless Board.in_board?(pos)

    target = piece_at(pos)
    return :same_team if target.is_a?(Piece) && piece.team == target.team

    status =  case piece
              when King
                king_move(piece, pos)
              when Pawn
                pawn_move(piece, pos)
              else
                other_move(piece, pos)
              end
    return :has_winner if target.is_a?(King) && status

    # success return true else false
    status
  end

  private

  def replace(piece, pos)
    # chess piece go out this place => empty
    @board[piece.x][piece.y] = ' '
    x = pos[0].to_i
    y = pos[1].to_i
    # set new position for chess piece
    piece.x = x
    piece.y = y
    # move to new place
    @board[x][y] = piece
    true
  end

  def pawn_move(piece, pos)
    target_piece = piece_at(pos)
    # pawn can move ahead if target is empty or can move
    if (pos[1].to_i == piece.y && !target_piece.is_a?(Piece)) ||
       (pos[1].to_i != piece.y && target_piece.is_a?(Piece))
      path = piece.path_to(pos)
    else
      return false
    end

    result = path[0...-1].none? { |pos| piece_at(pos).is_a? Piece }
    if result
      piece.first_time
      # ordain
      if pos.start_with?(/1|8/)
        puts "Would you like to ordain this pawn?\nType number 1 -> 4 for your option, type else for not ordain\n1: Queen\n2: Rook\n3: Bishop\n4: Knight"
        option = gets.strip

        case option
        when '1'
          piece = Queen.new(1, 1, piece.team)
        when '2'
          piece = Rook.new(1, 1, piece.team)
        when '3'
          piece = Bishop.new(1, 1, piece.team)
        when '4'
          piece = Knight.new(1, 1, piece.team)
        end
      end
      replace(piece, pos)
    end
    result
  end

  def king_move(piece, pos)
    path = piece.path_to(pos)
    # TODO: add valid target moving (Is it safe to move?)
    return false if path.empty?

    replace(piece, pos)
  end

  def other_move(piece, pos)
    path = piece.path_to(pos)

    return false if path.empty?

    result = path[0...-1].none? { |pos| piece_at(pos).is_a? Piece }
    replace(piece, pos) if result

    result
  end

  # Pieces: Rook, Bishop, Queen, Knight, Pawn, King
  # Type color: black(b), white(w)
  def create_board
    [
      %w[__ 1 2 3 4 5 6 7 8],
      [
        '1 ', Rook.new(1, 1), Knight.new(1, 2), Bishop.new(1, 3), Queen.new(1, 4),
        King.new(1, 5), Bishop.new(1, 3), Knight.new(1, 2), Rook.new(1, 1)
      ],
      Array.new(8) { |i| Pawn.new(2, i + 1) }.unshift('2 '),
      Array.new(8, ' ').unshift('3 '),
      Array.new(8, ' ').unshift('4 '),
      Array.new(8, ' ').unshift('5 '),
      Array.new(8, ' ').unshift('6 '),
      Array.new(8) { |i| Pawn.new(7, i + 1, :w) }.unshift('7 '),
      [
        '8 ', Rook.new(8, 1, :w), Knight.new(8, 2, :w), Bishop.new(8, 3, :w),
        Queen.new(8, 4, :w), King.new(8, 5, :w), Bishop.new(8, 3, :w),
        Knight.new(8, 2, :w), Rook.new(8, 1, :w)
      ]
    ]
  end
end
