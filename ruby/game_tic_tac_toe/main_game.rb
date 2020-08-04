load 'lib_game.rb'

puts "Type players's name"

puts "Player 01"
player01 = gets.chomp
player1 = PlayerOne.new(player01)

puts "Player 02"
player02 = gets.chomp
player2 = PlayerTwo.new(player02)

choose = ' '
turn = true
round = 1

while (round <= 9 || choose == 'exit') do

  while !(Player.exist_position?(choose) || choose == 'exit game') do
    puts "Your turn, #{ turn == true ? player1.name_player + '(X)' : player2.name_player + '(O)' }:"
    print ("Please type your choose position (number-char) like: 1a, 2c... (type 'exit game' if you want to exit). Your choose is: ")
    choose = gets.chomp
  end

  break if choose == 'exit game'

  if turn == true
    player1.position(choose)
  else
    player2.position(choose)
  end

# Game Board
  puts "+..a.b.c."
  print "1.|#{GameBoard.arr['1a']}|#{GameBoard.arr['1b']}|#{GameBoard.arr['1c']}|\n2.|#{GameBoard.arr['2a']}|#{GameBoard.arr['2b']}|#{GameBoard.arr['2c']}|\n3.|#{GameBoard.arr['3a']}|#{GameBoard.arr['3b']}|#{GameBoard.arr['3c']}|\n"
  puts

  turn = !(turn)
  round += 1
  choose = ' '

  if player1.win?
    puts "*****~ #{player1.name_player} is the Champion!! ~*****"
    break
  end

  if player2.win?
    puts "*****~ #{player2.name_player} is the Champion!! ~*****"
    break
  end

  if round > 9
    puts '\*/ \*/ This is a draw match \*/ \*/'
  end

end
