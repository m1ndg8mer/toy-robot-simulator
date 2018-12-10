require_relative '../board'
require_relative '../toy_robot'
require_relative '../game'
require_relative '../command'
require_relative '../direction'

require 'minitest/spec'
require 'minitest/autorun'
 
class ToyRobotTest < Minitest::Test
  def setup
    @board = Board.new(5, 5)
    @robot = ToyRobot.new(@board)
    @game = Game.new(@board, @robot)
  end

  def test_first
    @game.eval('PLACE 0,0,NORTH')
    @game.eval('MOVE')

    assert_output(/Output: 0,1,NORTH/) { @game.eval('REPORT') }
  end

  def test_second
    @game.eval('PLACE 0,0,NORTH')
    @game.eval('LEFT')

    assert_output(/Output: 0,0,WEST/) { @game.eval('REPORT') }
  end

  def test_last
    @game.eval('PLACE 1,2,EAST')
    @game.eval('MOVE')
    @game.eval('MOVE')
    @game.eval('LEFT')
    @game.eval('MOVE')

    assert_output(/Output: 3,3,NORTH/) { @game.eval('REPORT') }
  end

  def test_left_rotation
    @game.eval('PLACE 0,0,NORTH')

    # rotate robot on 360 degrees
    @game.eval('LEFT')
    @game.eval('LEFT')
    @game.eval('LEFT')
    @game.eval('LEFT')

    # assert the same direction
    assert_output(/Output: 0,0,NORTH/) { @game.eval('REPORT') }
  end

  def test_right_rotation
    @game.eval('PLACE 0,0,NORTH')

    # rotate robot on 360 degrees
    @game.eval('RIGHT')
    @game.eval('RIGHT')
    @game.eval('RIGHT')
    @game.eval('RIGHT')

    # assert the same direction
    assert_output(/Output: 0,0,NORTH/) { @game.eval('REPORT') }
  end
end
