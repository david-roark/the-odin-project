require_relative 'lib/cons'
require_relative 'lib/game'

dir = Dir.pwd
# make sure project can read and write history
unless %r{/final-project$} =~ dir
  puts "Your current path: #{dir}"
  puts 'Make sure you are in "final-project" folder, that means you can run command: ruby play_game.rb)'
  exit
end

system('clear')

puts WELCOME
Game.show_loading

game_on = true
menu = true

system('clear')
while game_on
  catch(:quit) do
    while menu
      menu = false
      puts MENU
      print PROMT
      option_menu = nil
      option_menu = gets.strip until %w[1 2 3 4].include?(option_menu)

      case option_menu
      when '1'
        game = Game.new
        game.start
        game.setup_player
      when '2'
        game = Game.load_game
        if game.is_a?(Game)
          game.start
        else
          puts 'Empty!!!'
          menu = true
        end
      when '3'
        puts HELP
        menu = true
        sleep(5)
      when '4'
        game_on = false
        throw :quit
      end
    end

    # play
    catch(:play) do
      Game.show_loading
      system('clear')

      while game && game.status
        break if game.winner

        system('clear')
        game.show_board
        puts "Your turn, #{game.current_player.name} (#{game.current_player.team == :b ? 'black' : 'white'} pieces chess)\n\n"
        status_get_piece = nil
        until status_get_piece
          status_get_piece = game.get_piece
          next unless status_get_piece == :exit

          game.off
          game.save
          menu = true
          throw :play
        end

        status_move_piece = nil
        until status_move_piece
          status_move_piece = game.move_piece
          next unless status_move_piece == :exit

          game.off
          game.save
          menu = true
          throw :play
        end
        next if status_move_piece == :other_piece
        break if status_move_piece == :has_winner

        game.next_player
      end

      if game.winner
        print 'The winner is '
        sleep(1)
        puts game.winner.name.upcase
        puts 'Congratulations!'
        game.off
        game.save
      end
      puts 'Type "exit" for exit game, else for back to menu.'
      print PROMT
      a = gets.strip
      if a == 'exit'
        game = nil
        game_on = false
        throw(:quit)
      else
        menu = true
      end
    end
  end
end
puts GOODBYE
