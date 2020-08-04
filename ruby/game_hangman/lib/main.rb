load 'model.rb'
require 'colorize'
require 'csv'

game_on = true
while game_on == true do
  puts "H"*50
  puts 'WELCOME TO GAME HANGMAN'.red + '(made by David Roark)'
  choose = nil

  until %w(1 2 3 4).include? choose do
    puts "Please type a number:\n1 New game\n2 Countinue\n3 History\n4 Exit"
    choose = gets.chomp

    if choose == '3'
      puts "History (10 closest!)"
      HangMan.show_history(10)
      choose = nil
    end

    if choose == '4'
      game_on = false
      break
    end
  end

  break if game_on == false
  # Setup for new player
  if choose == '1'
    puts "Let's play now!\nWhat's your name?"
    name = gets.chomp.squeeze
    name = nil if name.empty? || name == ' '
    player = HangMan.new(name)
    # set up random secret word
    secret_word = player.random_word
    secret_word = player.random_word while secret_word.size < 5 || secret_word.size > 12

    puts '-o' * 25
    puts "Wellcome! #{player.name.capitalize}, you have 5 #{"\u2665".chr.red}.\nType 'exit' whenever you want to exit!"
    puts "Your word have #{player.secret_word.size} letters: #{player.hide_word.join.yellow}"
    heart = 5
    turn = 1

  # setup for countinue
  elsif choose == '2'
    n_coutinue = -1
    x = nil
    while !(n_coutinue >= 0 && n_coutinue <= x)  do
      puts 'Type a number to countinue: (default: 0)'
      puts '='*50
      x = Countinue.show_countinue - 1
      puts '='*50
      n_coutinue = gets.chomp.to_i
    end

    player = Countinue.new(n_coutinue)
    puts "Welcome back, #{player.name}. You have #{player.heart} #{"\u2665".chr.red}.\nType 'exit' whenever you want to exit!"
    puts "Your word have #{player.secret_word.size} letters: #{player.answer.join.yellow}"
    heart = player.heart.to_i
    turn = player.turn.to_i
  end

  # play-area
  while heart > 0
    puts
    char = ' '
    exit = false

    while char == ' ' && char != 'exit'
      print heart != 1 ? "TURN #{turn}: ".green : 'LAST TURN: '.red
      puts 'Please type the char like a, b, c, ... or exit if you want to exit'
      puts "Your heart: #{"\u2665".chr.red * heart}"
      print 'Your choose: '
      char = gets.chomp.downcase.squeeze

      if char == 'exit'
        exit = true
        game_on = false
        break
      else
        char = ' ' if char.empty? || char.size > 1
      end
    end

    if exit == true
      puts 'Do you want to save your progress? (type y for yes, else for no)'
      ip = gets.chomp
      if ip == 'y'
        player.save(turn, heart)
        puts 'Your progress has been saved.'
        event = 'pause'
      end
      puts 'See you again.'
      break
    end

    heart -= 1 unless player.check_char(char)
    puts "Your word: #{player.show_char(char).yellow}"
    puts '~~o~~'.center 50

    unless player.answer.include? '_ '
      puts '=' * 50
      puts "You are the championship. The secret word is: #{player.secret_word.upcase}"
      event = 'win'
      break
    end

    turn += 1
  end

  if heart == 0 && exit == false
    event = 'lose'
    puts "#{'=' * 50}\nYou have lose!!! The secret word is: #{player.secret_word.upcase.red}"
  end

  player.save_history(event)
  break if game_on == false
  puts 'Do you want to countinue play? (Type y for yes, else for no)'
  gets.chomp == 'y' ? game_on = true : game_on = false
end
