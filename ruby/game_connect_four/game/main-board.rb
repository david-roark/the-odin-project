load 'lib.rb'

puts "Type players's name"

puts "Player 01 => #{"\u2686".chr}"
player01 = gets.chomp
player1 = Player.new(player01, "\u2686".chr)

puts "Player 02 => #{"\u2686".chr}"
player02 = gets.chomp
player2 = Player.new(player02, "\u2688".chr)

range = (4..35).to_a
n_row = '4'
n_col = '4'
loop do
  puts "What is the size of the board? please type a number grater than 4 and less than 35"
  print 'Row:'
  n_row = gets.chomp
  print 'Column:'
  n_col = gets.chomp
  break if range.include?(n_row.to_i) && range.include?(n_col.to_i)
end

GameBoard.new(n_row, n_col)
size_board = (n_row.to_i) * (n_col.to_i)
player_x = true
round = 0
puts "LET'S PLAY!\n"

loop do
  # Game Board
  GameBoard.board
  round += 1
  choose = ''

  loop do
    puts "Your turn, #{ player_x == true ? player1.name + ': ' + "\u2686".chr : player2.name + ': ' + "\u2688".chr }"
    print ("Please type your choose position (row-column) like: 1.1, 5.7 ... (type 'exit game' if you want to exit). Your choose is: ")
    choose = gets.chomp
    break if  choose == 'exit game' || Player.exist?(choose)
  end

  break if choose == 'exit game'

  player_x == true ? player1.tick(choose) : player2.tick(choose)

  player_x = !(player_x)
  choose = ' '

  if player1.win?
    GameBoard.board
    puts "*****~ #{player1.name} is the Champion!! ~*****"
    break
  end

  if player2.win?
    GameBoard.board
    puts "*****~ #{player2.name} is the Champion!! ~*****"
    break
  end

  if round >= size_board
    puts '\*/ \*/ This is a draw match \*/ \*/'
    break
  end

end
