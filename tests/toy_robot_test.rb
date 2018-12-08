require_relative '../board'
require_relative '../toy_robot'
require_relative '../game'
require_relative '../command'
require_relative '../direction'

require 'test/unit'
 
class ToyRobotTest < Test::Unit::TestCase
  def setup
    @board = Board.new(5, 5)
    @robot = ToyRobot.new(@board)
    @game = Game.new(@board, @robot)
  end

  def test_first
    @game.place_robot(['0', '0', 'NORTH'])
    @robot.move

    assert_equal('0,1,NORTH', @game.generate_report)
  end

  def test_second
    @game.place_robot(['0', '0', 'NORTH'])

    @robot.rotate_left

    assert_equal('0,0,WEST', @game.generate_report)
  end

  def test_last
    @game.place_robot(['1', '2', 'EAST'])

    @robot.move
    @robot.move
    @robot.rotate_left
    @robot.move

    assert_equal('3,3,NORTH', @game.generate_report)
  end
end
