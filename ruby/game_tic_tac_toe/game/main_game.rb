load 'lib_game.rb'

puts "Type players's name"

puts "Player 01"
player01 = gets.chomp
player1 = Player.new(player01, 'X')

puts "Player 02"
player02 = gets.chomp
player2 = Player.new(player02, 'O')

choose = ' '
player_x = true
round = 1
puts "LET'S PLAY!\n"

while (round <= 9 || choose == 'exit') do
  # Game Board
  GameBoard.game_board

  while !(Player.exist_position?(choose) || choose == 'exit game') do
    puts "Your turn, #{ player_x == true ? player1.name_player + '(X)' : player2.name_player + '(O)' }:"
    print ("Please type your choose position (number-char) like: 1a, 2c... (type 'exit game' if you want to exit). Your choose is: ")
    choose = gets.chomp
  end

  break if choose == 'exit game'

  player_x == true ? player1.position(choose) : player2.position(choose)

  player_x = !(player_x)
  round += 1
  choose = ' '

  if player1.win?
    player1.win_board
    GameBoard.game_board
    puts "*****~ #{player1.name_player} is the Champion!! ~*****"
    break
  end

  if player2.win?
    player2.win_board
    GameBoard.game_board
    puts "*****~ #{player2.name_player} is the Champion!! ~*****"
    break
  end

  if round > 9
    puts '\*/ \*/ This is a draw match \*/ \*/'
  end

end
