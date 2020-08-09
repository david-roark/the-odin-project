# create and display board game
class GameBoard
  attr_reader :x, :y
  def initialize(row, col)
    @@x = ('1.'..(col.to_s + '.')).to_a
    @@y = ('1'..(row.to_s)).to_a
    @@BOARD = Hash.new { |hash, key| hash[key] = "\u2610".chr }

    board_keys.each { |xy| @@BOARD[xy] }
  end

  def board_keys
    @@x.product(@@y).map { |arr| arr.join }
  end

  def self.board
    # group by row by row
    hash_board = @@BOARD.to_a.group_by { |v| v[0].split('.')[-1] }
    # print col title
    print '   '
    @@x.each { |num| print num[0..-2].ljust(3, ' ') }
    puts "\n\n"
    # print each row with title row
    hash_board.each_value.with_index do |row, index|
      print @@y[index].ljust(3, ' ')
      row.each { |cell| print cell[1] + '  ' }
      puts
    end
  end
  private :board_keys
end

class Player < GameBoard
  def initialize(name, chose = [])
    @name = name
    @chose = chose
  end
  def win?
    resuilt = false
    chose = @chose
    last_chose = @chose[-1]

    # check row
    group_row = chose.group_by { |choose| choose.split('.')[0] }.values
    group_row.each do |group|
      group.sort!
      resuilt = group.size == 4 && group[0..-2].map.with_index { |cell, index| cell.next == group[index+1] }.uniq == [true]
      return true if resuilt == true
    end
    # check col
    group_col = chose.group_by { |choose| choose.split('.')[-1] }.values
    group_col.each do |group|
      group.sort!
      resuilt = group.size == 4 && group[0..-2].map.with_index { |cell, index| cell.split('.')[0].next == group[index+1].split('.')[0] }.uniq == [true]
      return true if resuilt == true
    end
    # check along a diagonal
    group_cell = chose[0..-2].combination(3).to_a.map { |arr| arr.push(last_chose) }

    group_cell.each do |group|
      group.sort!
      # check diagonal 1
      resuilt =
        group.size == 4 &&
        group[0..-2].map.with_index { |cell, index| cell.split('.')[0].next == group[index+1].split('.')[0] }.uniq == [true] &&
        group[0..-2].map.with_index { |cell, index| cell.split('.')[1] == group[index+1].split('.')[1].next }.uniq == [true]
      return true if resuilt == true
      # check diagonal 2
      resuilt =
        group.size == 4 &&
        group[0..-2].map.with_index { |cell, index| cell.split('.')[0].next == group[index+1].split('.')[0] }.uniq == [true] &&
        group[0..-2].map.with_index { |cell, index| cell.split('.')[1].next == group[index+1].split('.')[1] }.uniq == [true]
      return true if resuilt == true

    end

    return resuilt
  end

  def row_up?(group)
    # code
  end
end
