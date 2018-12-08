class Position
  attr_accessor :x, :y, :direction

  def move(x, y)
    @x += x
    @y += y
  end

  def next_position
    new_position = self.dup

    case @direction
    when Direction::NORTH
      new_position.move(0, 1)
    when Direction::EAST
      new_position.move(1, 0)
    when Direction::SOUTH
      new_position.move(0, -1);
    when Direction::WEST
      new_position.move(-1, 0);
    end

    return new_position
  end

  def to_s
    @x.to_s + ',' + @y.to_s + ',' + @direction
  end
end
