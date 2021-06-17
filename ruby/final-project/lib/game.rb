require 'yaml'
require_relative 'cons'
require_relative 'pieces'
require_relative 'board'
require_relative 'player'

class Game
  def self.load_game
    return nil unless File.exist?('data/history.yml')

    YAML.load(File.read('data/history.yml'))
  end

  def self.show_loading
    20.times do
      print '='
      sleep(rand / 10.0)
    end
  end

  attr_reader :status, :player_1, :player_2, :current_player, :winner

  def initialize
    @player_1 = Player.new(:w)
    @player_2 = Player.new(:b)
    @board = Board.new
    @current_player = @player_1
    @status = false
    @winner = nil
  end

  def setup_player
    puts 'Name of first player (white pieces chess):'
    print PROMT
    name_p1 = gets.strip
    @player_1.name = name_p1 unless name_p1 == ''

    puts 'Name of second player (black pieces chess):'
    print PROMT
    name_p2 = gets.strip
    @player_2.name = name_p2 unless name_p2 == ''
    nil
  end

  def start
    @status = true
  end

  def off
    @status = false
  end

  def show_board
    @board.show
  end

  def get_piece
    puts "Type position of the piece chess do you want to move, #{@current_player.name}."
    print PROMT
    pos = gets.strip
    return :exit if pos == 'exit'

    unless Board.in_board?(pos)
      puts 'Please type position of piece in board like "12", "57",...'
      return false
    end

    piece = @board.piece_at(pos)
    unless piece.is_a? Piece
      puts 'Please, chose a chess piece'
      return false
    end

    unless piece.team == @current_player.team
      puts 'Please take piece of your team.'
      return false
    end
    @current_player.hold = piece
    true
  end

  # return :exit, :other_piece, true, false
  def move_piece
    puts "Type position do you want to move #{@current_player.hold.show} (at #{@current_player.hold.position}) to, #{@current_player.name}."
    print PROMT
    pos = gets.strip

    return :exit if pos == 'exit'
    return :other_piece if pos == 'other piece'

    target = @board.piece_at(pos)
    status = @board.move(@current_player.hold, pos)

    case status
    when :not_in_board
      puts 'Please type position of piece in board like "12", "57",...'
      false
    when :same_team
      puts 'Oh, Nooooooo! Your team is here!!!'
      false
    when :has_winner
      @winner = @current_player
      off
      :has_winner
    when true
      puts "Moving success #{@current_player.hold.show} to #{pos}"
      true
    when false
      puts "Can not pick #{@current_player.hold.show} at #{@current_player.hold.position} to #{pos}!"
      false
    end
  end

  def next_player
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end

  def save(option = 'w')
    File.open('data/history.yml', option) { |f| f.write(to_yaml) }
  end
end
