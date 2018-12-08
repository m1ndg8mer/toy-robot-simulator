require_relative 'board'
require_relative 'toy_robot'
require_relative 'game'
require_relative 'command'
require_relative 'direction'

board = Board.new(5, 5)
robot = ToyRobot.new(board)

game = Game.new(board, robot)

puts 'Toy Robot Simulator'
puts 'Enter a command. Valid commands are: '
puts 'PLACE X,Y,NORTH|SOUTH|EAST|WEST, MOVE, LEFT, RIGHT, REPORT, EXIT\n'

while true
    command = gets.chomp

    break if command == 'EXIT'
    begin
      game.eval(command) 

    rescue => e
      puts e.message
    end
end
