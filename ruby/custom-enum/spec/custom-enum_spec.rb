require './custom-enum'

describe Enumerator do
  context "test #my_each vs. #each" do
    arr = Array.new(10) { rand(43) }
    it 'with no block given will return Enumerator' do
      result = arr.my_each

      expect(result.inspect).to match(/Enumerator: \[#{arr*", "}\]:my_each/)
    end

    xit "given block the method will pass each element and return the origin array" do
      s1 = 0
      arr1 = arr.my_each { |x| s1 += x }
      s2 = 0
      arr2 = arr.each { |x| s2 += x }

      expect(s1).to eq(s2)
      expect(arr1).to equal(arr)

    end
  end

  context "test #my_each_with_index vs. #each_with_index" do
    arr = Array.new(10) { rand(12) }
    xit 'with no block given will return Enumerator' do
      result = arr.my_each_with_index

      expect(result.inspect).to match(/Enumerator: \[#{arr*", "}\]:my_each_with_index/)
    end

    xit "given block the method will pass each element and return the origin array" do
      s1 = 0
      arr1 = arr.my_each_with_index { |x, i| s1 += x + i }
      s2 = 0
      arr2 = arr.each_with_index { |x, i| s2 += x + i }

      expect(s1).to eq(s2)
      expect(arr1).to equal(arr)
    end
  end

  context "test #my_select vs. select" do

    arr = Array.new(10) { rand(10) }
    xit "return Enumerator unless block given" do
      result = arr.my_select

      expect(result.inspect).to match(/Enumerator: \[#{arr*", "}\]:my_select/)
    end

    xit "return new array and the origin array will not change" do
      memo = arr
      arr1 = arr.my_select { |x| x >= 3 }
      arr2 = arr.select { |x| x >= 3 }

      expect(arr1).to eq(arr2)
      expect(arr).to eq(memo)
    end
  end

  context "test #my_all? vs. all?" do

    xit "no block given" do
      arr = []
      expect(arr.my_all?).to eql(arr.all?)
    end

    xit "should true" do
      arr = Array.new(10) { rand(42) }
      a = arr.my_all? { |x| x <= 10 }
      b = arr.all? { |x| x <= 10 }
      expect(b).to eql(a)
    end
  end

  context "test #my_any? vs. any?" do

    xit "no block given" do
      arr = []
      expect(arr.my_any?).to eql(arr.any?)
    end

    xit "should true" do
      arr = Array.new(10) { rand(20) }
      a = arr.my_any? { |x| x <= 10 }
      b = arr.any? { |x| x <= 10 }
      expect(b).to eql(a)
    end
  end

  context "test #my_none? vs. none?" do

    xit "no block given" do
      arr = []
      expect(arr.my_none?).to eql(arr.none?)
    end

    xit "should true" do
      arr = Array.new(10) { rand(20) }
      a = arr.my_none? { |x| x <= 10 }
      b = arr.none? { |x| x <= 10 }
      expect(b).to eq(a)
    end
  end

  context "test #my_count vs. #count" do

    arr = Array.new(20) { rand(10) }
    xit "no given block and no param" do
      a = arr.my_count
      b = arr.count
      expect(b).to eq(a)
    end

    xit "param is 4" do
      a = arr.my_count(4)
      b = arr.count(4)
      expect(b).to eq(a)
    end

    xit "param is 440" do
      a = arr.my_count(440)
      b = arr.count(440)
      expect(b).to eq(a)
    end

    xit "with block given" do
      a = arr.my_count { |x| x > 3 }
      b = arr.count { |x| x > 3 }
      expect(b).to eq(a)
    end
  end

  context "test #my_map vs. #map" do
    arr = %w(1 2 3 5 54 253 523 52 523)
    xit "return Enumerator unless block given" do
      result = arr.my_map

      expect(result.inspect).to match(/Enumerator: \[.+\]:my_map/)
    end

    xit "return new arr and the origin array not change" do
      arr1 = arr.my_map(&:to_i)
      arr2 = arr.map(&:to_i)

      expect(arr1).to eq(arr2)
      expect(arr1).not_to eq(arr)
    end
  end

  context "test #my_inject vs. #inject" do
    arr = Array.new(10) { rand(100) }

    xit "raise LocalJumpError if no block  given" do
      expect { arr.my_inject }.to raise_error(LocalJumpError)
    end

    xit "sum of array, no given param and the origin array not change" do
      memo = arr
      result1 = arr.my_inject { |s, x| s += x }
      result2 = arr.inject { |s, x| s += x }

      expect(result1).to eq(result2)
      expect(arr).to eq(memo)
    end

    xit "sum of array with param (first value) and the origin array not change" do
      memo = arr
      result1 = arr.my_inject(100) { |s, x| s += x }
      result2 = arr.inject(100) { |s, x| s += x }

      expect(result1).to eq(result2)
      expect(arr).to eq(memo)
    end
  end
end
