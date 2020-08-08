require './lib/caesar_cipher'

describe CaesarCipher do
  describe '#caesar_cipher' do
    it "string with symbol '!','_'" do
      expect(CaesarCipher.caesar_cipher('What_a string!', 5)).to eql('Bmfy_f xywnsl!')
    end

    it 'Work with a number > 26' do
      expect(CaesarCipher.caesar_cipher('A', 53)).to eql('B')
    end

    it "work with a number < 0" do
      expect(CaesarCipher.caesar_cipher('a', -1)).to eql('z')
    end
  end
end
