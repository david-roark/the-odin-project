# create and display board game
class GameBoard
  attr_reader :x, :y
  def initialize(row = '4', col = '4')
    @@x = ('1.'..(row + '.')).to_a
    @@y = ('1'..col).to_a
    @@BOARD = Hash.new { |hash, key| hash[key] = "\u2610".chr }

    board_keys.each { |xy| @@BOARD[xy] }
  end

  def board_keys
    @@x.product(@@y).map { |arr| arr.join }
  end

  def self.board
    # group by row by row
    hash_board = @@BOARD.to_a.group_by { |v| v[0].split('.')[0] }
    # print col title
    print '   '
    @@y.each { |num| print num.ljust(3, ' ') }
    puts "\n\n"
    # print each row with title row
    hash_board.each_value.with_index do |row, index|
      print @@x[index][0..-2].ljust(3, ' ')
      row.each { |cell| print cell[1] + '  ' }
      puts
    end
  end
  private :board_keys
end

class Player < GameBoard
  attr_reader  :name
  @@list_chose = []

  def initialize(name, mark = "\u2610".chr, chose = [])
    @name = name
    @mark = mark
    @chose = chose
  end

  def self.exist?(choose)
    @@BOARD.has_key?(choose) && @@BOARD[choose] == "\u2610".chr ? true : false
  end

  def tick(choose)
    @@BOARD[choose] = @mark
    @chose << choose
    self
  end

  def win?
    resuilt = false
    chose = @chose
    last_chose = @chose[-1]
    group_cell = chose[0..-2].combination(3).to_a.map { |arr| arr.push(last_chose) }

    group_cell.each do |group|
      group.sort!
      # check in a row
      resuilt = group.size == 4 && same_row?(group) && col_up?(group)
      return true if resuilt == true
      # check in a col
      resuilt = group.size == 4 && same_col?(group) && row_up?(group)
      return true if resuilt == true
      # check along a diagonal
      # + check diagonal 1
      resuilt = group.size == 4 && row_up?(group) && col_down?(group)
      return true if resuilt == true
      # + check diagonal 2
      resuilt = group.size == 4 && row_up?(group) && col_up?(group)
      return true if resuilt == true
    end

    return resuilt
  end

  def same_row?(group)
    group.map{ |cell| cell.split('.')[0] == group[0].split('.')[0] }.uniq == [true]
  end

  def same_col?(group)
    group.map{ |cell| cell.split('.')[1] == group[0].split('.')[1] }.uniq == [true]
  end

  def row_up?(group)
    group[0..-2].map.with_index { |cell, index| cell.split('.')[0].next == group[index+1].split('.')[0] }.uniq == [true]
  end

  def col_up?(group)
    group[0..-2].map.with_index { |cell, index| cell.split('.')[1].next == group[index+1].split('.')[1] }.uniq == [true]
  end

  def col_down?(group)
    group[0..-2].map.with_index { |cell, index| cell.split('.')[1] == group[index+1].split('.')[1].next }.uniq == [true]
  end

  private :row_up?, :col_up?, :col_down?, :same_row?, :same_col?
end
