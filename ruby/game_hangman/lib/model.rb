class HangMan
  attr_reader :name, :secret_word, :answer, :turn, :heart

  def initialize(name)
    @name = name || 'Player'
    @secret_word = ''
    @answer = []
  end

  def random_word(file_path = '../db/5desk.txt')
    file_path = '../db/5desk.txt' unless File.exist? file_path
    words = File.readlines file_path
    @secret_word = words[rand(words.size - 1)].chomp.downcase
  end

  def hide_word
    @answer = @secret_word.gsub(/\w/, '_ ').scan('_ ')
  end

  def check_char(char)
    @secret_word.include? char
  end

  def show_char(char = nil)
    @secret_word.chars.each_with_index { |c, i| @answer[i] = char + ' ' if c == char }
    @answer.join
  end

  def save(turn, heart)
    File.open('../log/pause.csv', 'a') { |f| f.puts "#{Time.now},#{@name},#{@secret_word},#{@answer.join('|')},#{turn},#{heart}" }
  end

  def save_history(event)
    event ||= 'break'
    File.open('../log/history.csv', 'a') { |f| f.puts "#{Time.now},#{@name},#{@secret_word},#{event}" }
  end

  def self.show_history(number)
    history = CSV.read '../log/history.csv', headers: true, header_converters: :symbol

    history.reverse_each.with_index do |r, i|
      puts "#{i}. Player: #{r[:name]}, secret word: #{r[:event] == 'lose' || r[:event] == 'win' ? r[:secret_word] : '_ _ _'}, result: #{r[:event]} at: #{r[:time]}"
      break if i == number
    end
  end

  # countinue methods

end
class Countinue < HangMan
  attr_reader :heart, :turn

  def initialize(number)
    list_countinue = CSV.read '../log/pause.csv', headers: true, header_converters: :symbol

    list_countinue.each.with_index do |r, i|
      next unless i == number

      @name = r[:name]
      @secret_word = r[:secret_word]
      @answer = r[:answer].split('|')
      @turn = r[:turn]
      @heart = r[:heart]
      break
    end
    list_countinue.delete(number)
    File.open("../log/pause.csv", 'w'){ |f| f.print list_countinue }
  end

  def self.show_countinue
    list = CSV.read "../log/pause.csv", headers: true, header_converters: :symbol

    list.each.with_index do |row, i|
      puts "#{i}. Player: #{row[:name]}, you have #{row[:heart]} #{"\u2665".chr.red} at turn: #{row[:turn]}"
    end
    list.size
  end
end
