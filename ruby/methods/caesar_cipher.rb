def caesar_cipher(string, number = 1)
  array_az = ('a'..'z').to_a
  array_crypto = string.chars

  array_crypto.map!.with_index {|char, index|
    if array_az.include?(char) #check lowercase chars
      char = array_az[(array_az.index(char) + number)%26]
    elsif array_az.include?(char.downcase) #check uppercase chars
      char = array_az[(array_az.index(char.downcase) + number)%26].upcase
    else # check another chars
      char
    end
  }

  array_crypto.join
end

p caesar_cipher("What a string!", 5)
# Clear Comment (=begin, =end) if you want to type string and number by Command line interface
=begin
  puts "Type the string need to script by Ceasar Cipher:"
  s = gets.chomp
  puts "Type the number shift factor:"
  n = gets.chomp.to_i
  puts caesar_cipher(s, n)
=end