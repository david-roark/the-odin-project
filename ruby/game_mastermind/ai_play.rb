load 'lib_game.rb'

puts "Your box color: black, white, green, red, purple, yellow, blue, brown, pink and gray"
secret_code = []
while secret_code.size != 4 do
  puts "Type secret code, please type color in box color (secret code have four code like 'red red red red'...)"
  secret_code = gets.chomp.scan(/\w+/)
end


ai = PlayerAI.new(secret_code)
turn = 0
while !(ai.check_ai_answer == [true]*4) do
  turn += 1
  puts
  if turn > 10000
    turn = false
    break
  end
end
if turn == false
  puts "AI have used too much times for guess the secret code (over 10.000 times)"
else
   puts "Done after #{turn} times"
   puts "AI code: #{ai.ai_code}"
   puts "AI check  answer: #{ai.check_answer}"
   puts "Your secret code: #{ai.secret_code}"
end
