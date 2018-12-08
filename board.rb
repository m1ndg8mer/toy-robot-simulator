class Board
  attr_accessor :rows, :columns

  def initialize(rows, columns)
    @rows, @columns = rows, columns
  end

  def valid_position(position)
    return (
      position.x >= 0 && position.x < @columns &&
      position.y >= 0 && position.y < @rows
    )
  end
end
