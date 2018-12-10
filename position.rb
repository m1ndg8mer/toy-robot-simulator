class Position
  attr_accessor :x, :y, :direction

  # why not create initialize method for the class?
  #
  # Also I think it could make sense to include board in the Position
  # that way we can check validity of position just asking it via method like valid?

  def move(x, y) # if move is not a part of public interface it should be private
    @x += x
    @y += y
  end

  def next_position # I think it's better to move all movement logic to ToyRobot
    new_position = self.dup

    case @direction
    when Direction::NORTH
      # I'd prefer to explicitly create new position
      # something like: Position.new(@x, @y + 1, @direction)
      new_position.move(0, 1)
    when Direction::EAST
      new_position.move(1, 0)
    when Direction::SOUTH
      new_position.move(0, -1);
    when Direction::WEST
      new_position.move(-1, 0);
    end

    return new_position # no need in return here
  end

  def to_s
    @x.to_s + ',' + @y.to_s + ',' + @direction
  end
end
