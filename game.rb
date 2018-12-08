class Game
  def initialize(board, robot)
    @board, @robot = board, robot
  end

  def place_robot(coordinates)
    position = Position.new

    position.x = coordinates[0].to_i
    position.y = coordinates[1].to_i
    position.direction = coordinates[2]

    if @board.valid_position(position)
      @robot.position = position
    else
      raise 'Invalid placed position...'
    end
  end

  def eval(command)
    execute = command.split.first

    raise 'Robot not in the board...' if (@robot.out_the_board? && execute != 'PLACE')
    case execute
    when Command::PLACE
      coordinates = command.split.last.split(',')
      place_robot(coordinates)
    when Command::MOVE
      @robot.move
    when Command::LEFT
      @robot.rotate_left
    when Command::RIGHT
      @robot.rotate_right
    when Command::REPORT
      generate_report
    else
      raise 'Failed command. Try again...'
    end
  end

  def generate_report
    puts "Output: #{@robot.position}"

    return @robot.position.to_s
  end
end
