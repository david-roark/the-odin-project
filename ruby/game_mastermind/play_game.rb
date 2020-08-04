load 'lib_game.rb'

puts 'Wellcome to Mastermind :D'
puts "Let's play"

# Set up
answer = ''
while answer == ''
  puts "Would you like to set auto secret code? (Please type only 'yes' or 'no')"
  answer = gets.chomp
  if answer.downcase == 'yes'
    player = Player.new(SecretCode.random_secret_code)
    break
  elsif answer.downcase == 'no'
    puts "What is you secret code? (Please type a string like 'red green blue' ..."
    secret_code = gets.chomp.scan(/\w+/)
    player = Player.new(secret_code)
    break
  else
    answer = ''
  end
end
puts

# Play area

puts "Let's play now, you have 12 times for choose."
puts '~~0~0~0~~'.center(44)
puts "Your Box color: #{player.box_color}"

turn = 1
while turn <= 12
  puts "Turn: #{turn}/12"
  print "Type the code that you think it right(type 'exit' if you want exit), secret code have #{player.secret_code_size} color(s): "
  player_choose = gets.chomp.downcase

  if player_choose == 'exit'
    puts
    puts "The secret code is: #{player.secret_code.join(' ')}. See you again!"
    break
  end

  if player.same_size?(player_choose)
    nrc = player.number_right_color(player_choose)
    ncp = player.number_correct_position(player_choose)

    if nrc == player.secret_code_size && nrc == ncp
      puts '+========================================================+'
      puts '+ YOU ARE THE CHAMPION!!! ~~~~ match the secret code ~~~ +'
      puts "+ Secret code: #{player.secret_code.join(' ')}".ljust(57) + '+'
      puts "+ You won after #{turn} round".ljust(57) + '+'
      puts '+========================================================+'
      break
    else
      player.table_answer(player_choose, nrc, ncp)
      puts player.get_table_answer
      puts '----------------------------------------------------------'
      puts "You lose! The secret code is: #{player.secret_code.join(' ')}" if turn == 12
      turn += 1
    end
  else
    next
  end

end
