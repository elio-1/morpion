require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'board'
require 'player'



new_game = Game.new
new_game.new_board
player_one = Player.new('', 'X')
player_two = Player.new('', 'O')
positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
position = ''

def space
puts
end

# Tic tac toe Grid
def print_board(new_game)
  puts "
                    
                   |#{new_game.board[0][0]}|#{new_game.board[0][1]}|#{new_game.board[0][2]}|
                   |#{new_game.board[1][0]}|#{new_game.board[1][1]}|#{new_game.board[1][2]}|
                   |#{new_game.board[2][0]}|#{new_game.board[2][1]}|#{new_game.board[2][2]}|
                   "
end

# Get players names
def prompt_user(new_player, number)
    print "Player #{number} enter your name: "
    new_player.name = gets.chomp.strip
    puts "#{new_player.name} your symbol is #{new_player.symbol}"
end

# print ui
space
puts '     ----------- Tic Tac Toe -----------'
space
print_board(new_game)
space
prompt_user(player_one, 1)
space
prompt_user(player_two, 2)
space
puts "     ----------- Play! -----------"
space

# game conditions
game_ended = false
is_player_one_to_move = true # define players turn

while game_ended == false
  symbol = is_player_one_to_move ? 'X' : 'O'
  current_player = '' # define players turn
  if is_player_one_to_move
    puts "#{player_one.name} to play for #{player_one.symbol} "
    current_player = player_one.name
  else
    puts "#{player_two.name} to play for #{player_two.symbol} "
    current_player = player_two.name
  end
  loop do
    position = gets.chomp
      spot = new_game.get_spot(position)
      system("clear")
      new_game.update_board(spot, symbol)
      positions.delete(position.to_i)
      print_board(new_game)
      break
  end
  
  space
  if new_game.win? && symbol == 'X'
    puts "#{current_player} won!"
    space
    game_ended = true
  elsif new_game.win? && symbol == 'O'
    puts "{current_player} won!"
    space
    game_ended = true
  elsif new_game.draw?
    puts "Draw"
    space
    game_ended = true
  else
    is_player_one_to_move = !is_player_one_to_move  # define players turn
  end

end
