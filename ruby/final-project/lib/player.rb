class Player
  attr_reader :team
  attr_accessor :name, :hold

  def initialize(team, name = 'Player')
    @name = name
    @team = team
    @hold = nil
  end
end
