require './game/lib_game'

describe Player do
  describe "#win?" do
    let(:player) { Player.new('name', "X") }

    it "tick in row 1" do
      player.tick('1a').tick('1c').tick('1b')
      expect(player.win?).to eql(true)
    end

    it "tick in col 2" do
      player.tick('2b').tick('1b').tick('3b')
      expect(player.win?).to eql(true)
    end

    it "tick in cross" do
      player.tick('1a').tick('2b').tick('3c')
      expect(player.win?).to eql(true)
    end

    it "tick random for lose" do
      player.tick('1a').tick('2a').tick('3c')
      expect(player.win?).to eql(false)
    end
  end
end
