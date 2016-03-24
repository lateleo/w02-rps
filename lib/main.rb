

def require_rps #stalls until user responds with "rock", "paper", or "scissors".
  response = gets.chomp.downcase
  while !["rock", "paper", "scissors"].include?(response)
    puts "Please respond with 'rock', 'paper', or 'scissors'."
    response = gets.chomp.downcase
  end
  return 0 if response == "rock"
  return 1 if response == "paper"
  return 2 if response == "scissors"
end

def equation(a, b) # generates a unique number for each possible combination of 0, 1 and 2.
  a-b+3*a*b
end

def play_rps
  puts "Welcome! Let's begin."
  puts "Player 1, please make your choice."
  player1 = require_rps
  puts "Player 2, please make your choice."
  player2 = require_rps
  if [-2, 1, 7].include?(equation(player1, player2))
    puts "Player 1 wins!"
  elsif [-1, 2, 5].include?(equation(player1, player2))
    puts "Player 2 wins!"
  else
    puts "it's a tie!"
  end
end

play_rps
