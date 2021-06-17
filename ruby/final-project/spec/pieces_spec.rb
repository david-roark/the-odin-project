require './lib/pieces'

describe Rook do
  let (:rook) { Rook.new(1,3) }

  it "should be empty" do
    path = rook.path_to('85')
    expect(path).to be_empty
  end

  it "move from '13' to '15' should return ['14', '15']" do
    path = rook.path_to('15')
    expect(path).to eq(%w(14 15))
  end
  it "move from '13' to '83'" do
    path = rook.path_to('83')
    expect(path).to eq(%w(23 33 43 53 63 73 83))
  end
  it "move from '13' to '11'" do
    path = rook.path_to('11')
    expect(path).to eq(%w(12 11))
  end
end

describe Knight do
  let (:knight) { Knight.new(4,5) }

  it "should be empty" do
    path = knight.path_to('88')
    expect(path).to be_empty
  end

  it "move from '45' to '57' should return ['57']" do
    path = knight.path_to('57')
    expect(path).to eq(%w(57))
  end

  it "move from '45' to '24' should return ['24']" do
    path = knight.path_to('24')
    expect(path).to eq(%w(24))
  end
end

describe Bishop do
  let(:bishop) { Bishop.new(2,6) }

  it "should be emty" do
    path = bishop.path_to('36')
    expect(path).to be_empty
  end

  it "from '26' to '48' should be ['37', '48']" do
    path = bishop.path_to('48')
    expect(path).to eq(%w(37 48))
  end

  it "from '26' to '53' should be ['35', '44', '53']" do
    path = bishop.path_to('53')
    expect(path).to eq(%w(35 44 53))
  end
end

describe Queen do
  let(:queen) { Queen.new(2,6) }

  it "from '26' to '48' should be ['37', '48']" do
    path = queen.path_to('48')
    expect(path).to eq(%w(37 48))
  end

  it "from '26' to '44' should be ['35', '44']" do
    path = queen.path_to('44')
    expect(path).to eq(%w(35 44))
  end

  it "from '26' to '86' should be ['36', '46', '56', '66', '76', '86']" do
    path = queen.path_to('86')
    expect(path).to eq(%w(36 46 56 66 76 86))
  end

  it "from '26' to '23' should be ['25', '24', '23']" do
    path = queen.path_to('23')
    expect(path).to eq(%w(25 24 23))
  end

  it "from '26' to '15' should be ['15']" do
    expect(queen.path_to('15')).to eq(['15'])
  end

  it "should be empty" do
    path = queen.path_to('18')
    expect(path).to be_empty
  end
end

describe King do
  let(:king) { King.new(4,5) }

  it "from '45' to '88' should be empty" do
    expect(king.path_to('88')).to be_empty
  end

  it "from '45' to '55'" do
    expect(king.path_to('55')).to eq(['55'])
  end

  it "from '45' to '34' should be ['34']" do
    expect(king.path_to('34')).to eq(['34'])
  end
end

describe Pawn do
  let(:bpawn) { Pawn.new(2,6, :b)}
  let(:wpawn) { Pawn.new(6,6, :w)}

  it "test CAN NOT moving ahead greater than 2 step" do
    expect(bpawn.path_to('66')).to be_empty
    expect(wpawn.path_to('26')).to be_empty
  end

  it "in the first time moving can move ahead both 2 steps and 1 step" do
    expect(bpawn.path_to('46')).to eq(%w(36 46))
    bpawn.first_time = false
    expect(bpawn.path_to('46')).to be_empty
    expect(bpawn.path_to('36')).to eq(['36'])
  end

  it "CAN NOT moving back" do
    expect(bpawn.path_to('16')).to be_empty
    expect(wpawn.path_to('76')).to be_empty
  end

  it "moving diagonally forward" do
    expect(bpawn.path_to('37')).to eq(['37'])
    expect(bpawn.path_to('48')).to be_empty
    expect(wpawn.path_to('55')).to eq(['55'])
    expect(wpawn.path_to('33')).to be_empty
  end
end
