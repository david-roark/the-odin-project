class CaesarCipher

  def self.caesar_cipher(string, number = 1)
    array_az = ('a'..'z').to_a
    array_crypto = string.chars

    array_crypto.map.with_index {|char, index|
      if array_az.include?(char)
        #check lowercase chars
        array_az[(array_az.index(char) + number)%26]
      elsif array_az.include?(char.downcase)
        #check uppercase chars
        array_az[(array_az.index(char.downcase) + number)%26].upcase
      else
        # check none chars
        char
      end
    }.join
  end
end
