class Position
  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    @x, @y = x, y
    @direction = direction
  end

  def next_position
    case @direction
    when Direction::NORTH
      Position.new(@x, @y + 1, @direction)
    when Direction::EAST
      Position.new(@x + 1, @y, @direction)
    when Direction::SOUTH
      Position.new(@x, @y - 1, @direction)
    when Direction::WEST
      Position.new(@x - 1, @y, @direction)
    end
  end

  def to_s
    @x.to_s + ',' + @y.to_s + ',' + @direction
  end
end
