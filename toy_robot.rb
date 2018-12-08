require_relative 'position'

class ToyRobot
  attr_accessor :position

  def initialize(board)
    @position = Position.new
    @board = board
  end

  def move
    next_position = @position.next_position

    if(@board.valid_position(next_position))
      @position = next_position
    else
      raise 'Prevented robot failing...'
    end
  end

  def rotate_left
    index = Direction::DIRECTIONS.index(@position.direction)

    @position.direction =  Direction::DIRECTIONS[index - 1]
  end

  def rotate_right
    index = Direction::DIRECTIONS.index(@position.direction)
    # prevent out of bounds of array index
    if index == (Direction::DIRECTIONS.size - 1)
      @position.direction =  Direction::DIRECTIONS[0]
    else
      @position.direction =  Direction::DIRECTIONS[index + 1]
    end
  end

  def out_the_board?
    return (
      @position.x.nil? || @position.y.nil? || @position.direction.nil?
    )
  end
end
