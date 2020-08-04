class SecretCode
  @@BOX_COLOR = { 0 => 'black', 1 => 'white', 2 => 'green', 3 => 'red', 4 => 'purple', 5 => 'yellow', 6 => 'blue', 7 => 'brown', 8 => 'pink', 9 => 'gray' }

  def self.random_secret_code
    x = rand(6)
    Array.new(4) { rand(x+1..x+4) }.map! { |num| @@BOX_COLOR[num] }
  end

  def same_size?(player_choose)
    player_choose.scan(/\w+/).size == @secret_code_size
  end

  def number_right_color(player_choose)
    player_choose.scan(/\w+/).map { |color| @secret_code.include?(color) ? true : false }.count(true)
  end

  def number_correct_position(player_choose)
    @secret_code.zip(player_choose.scan(/\w+/)).count { |c| c[0] == c[1] }
  end
end

class Player < SecretCode
  attr_reader :secret_code, :secret_code_size

  @@TABLE_ANSWER = []

  def initialize(secret_code)
    @secret_code = secret_code
    @secret_code_size = @secret_code.size
  end

  def table_answer(player_choose, number_right_color, number_correct_position)
    @@TABLE_ANSWER << "Your choose: #{player_choose}. Number right color: #{number_right_color}. Number correct position: #{number_correct_position}."
  end

  def get_table_answer
    @@TABLE_ANSWER
  end

  def box_color
    @@BOX_COLOR.values.union(@secret_code).shuffle
  end
end

class PlayerAI < SecretCode
  attr_reader :box_right_color, :check_answer, :ai_code, :secret_code

  def initialize(secret_code)
    @secret_code = secret_code
    @ai_code
    @ai_answer = [nil]*4
    @box_right_color = [nil]*4
  end


end
