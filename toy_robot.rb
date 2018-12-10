require_relative 'position'

class ToyRobot
  attr_accessor :position

  def initialize(board)
    @position = Position.new # What's the point creating empty Position? We can initialize it with nil
    @board = board
  end

  def move
    next_position = @position.next_position

    if(@board.valid_position(next_position))
      @position = next_position
    else
      raise 'Prevented robot failing...' # This is not necessary, wrong move can be simply ignored
    end
  end

  def rotate_left
    index = Direction::DIRECTIONS.index(@position.direction)

    # This works for one rotation, but will fail
    # if method gets modified to perform n left rotations at once
    @position.direction =  Direction::DIRECTIONS[index - 1]
  end

  def rotate_right
    index = Direction::DIRECTIONS.index(@position.direction)

    # This can be rewritten using % operator:
    # @position.direction =  Direction::DIRECTIONS[(index + 1) % Direction::DIRECTIONS.size
    # prevent out of bounds of array index
    if index == (Direction::DIRECTIONS.size - 1)
      @position.direction =  Direction::DIRECTIONS[0]
    else
      @position.direction =  Direction::DIRECTIONS[index + 1]
    end
  end

  def out_the_board?
    # no need to use return
    return (
      # if we initialized @position with nil for not placed robot, we can check only with @position.nil?
      @position.x.nil? || @position.y.nil? || @position.direction.nil?
    )
  end
end
