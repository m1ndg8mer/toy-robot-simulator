require_relative 'position'

class ToyRobot
  attr_accessor :position

  def initialize(board)
    @board = board
  end

  def move
    next_position = @position.next_position

    if(@board.valid_position?(next_position))
      @position = next_position
    end
  end

  def rotate_left
    index = Direction::DIRECTIONS.index(@position.direction)

    @position.direction =  Direction::DIRECTIONS[index - 1]
  end

  def rotate_right
    index = Direction::DIRECTIONS.index(@position.direction)

    @position.direction =  Direction::DIRECTIONS[(index + 1) % Direction::DIRECTIONS.size]
  end

  def out_the_board?
    @position.nil?
  end
end
