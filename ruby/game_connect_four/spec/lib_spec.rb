require './game/lib'

describe Player do
  describe '#win?' do
    let(:board) { GameBoard.new(10, 10) }

    it 'in a row (win)' do
      player1 = Player.new('name', %w[1.1 5.9 2.1 1.2 1.3 1.4])
      expect(player1.win?).to eql(true)
    end

    it 'in a row (not win)' do
      player2 = Player.new('name', %w[1.1 2.6 3.4 1.2 1.3 1.7])
      expect(player2.win?).to eql(false)
    end

    it 'in a col (win)' do
      player3 = Player.new('name', %w[2.5 4.5 1.1 10.2 3.5 5.5])
      expect(player3.win?).to eql(true)
    end

    it 'in a col (not win)' do
      player4 = Player.new('name', %w[2.5 4.5 1.1 6.7 7.5 5.5])
      expect(player4.win?).to eql(false)
    end

    it 'along a diagonal 1-(2.2 3.3 4.4 5.5) (win)' do
      player5 = Player.new('mae', %w[2.2 5.6 10.10 5.5 3.3 4.4])
      expect(player5.win?).to eql(true)
    end

    it 'along a diagonal 2-(1.5 2.4 3.3 4.2) (win)' do
      player5 = Player.new('mae', %w[2.2 5.6 3.3 2.4 1.5 10.10 4.2])
      expect(player5.win?).to eql(true)
    end

    it 'along a diagonal (not win)' do
      player6 = Player.new('mae', %w[2.2 5.5 10.10 7.6 1.1 4.4])
      expect(player6.win?).to eql(false)
    end
  end
end
