class Me
  def initialize(window, maze)
    @x = Pickman::CELL_SIZE
    @y = Pickman::CELL_SIZE
    @window = window
    @maze = maze
    right
  end

  def draw
    window.draw_triangle(x + triangle[0][0], y + triangle[0][1], Gosu::Color::YELLOW,
                         x + triangle[1][0], y + triangle[1][1], Gosu::Color::YELLOW,
                         x + triangle[2][0], y + triangle[2][1], Gosu::Color::YELLOW,
                         ZOrder::Me)
  end

  def up
    @next = :up
  end

  def down
    @next = :down
  end

  def left
    @next = :left
  end

  def right
    @next = :right
  end

  def moving_up?
    triangle == TRIANGLE_UP
  end

  def moving_down?
    triangle == TRIANGLE_DOWN
  end

  def moving_left?
    triangle == TRIANGLE_LEFT
  end

  def moving_right?
    triangle == TRIANGLE_RIGHT
  end

  def can_move_up?
    can_move?(x, y - 1)
  end

  def can_move_down?
    can_move?(x, y + 1)
  end

  def can_move_left?;
    can_move?(x - 1, y)
  end

  def can_move_right?; can_move?(x + 1, y); end

  def can_move?(x, y)
    Pickman.corners(x, y).none? { |(x, y)| maze.block?(x, y) }
  end

  def move
    @triangle = TRIANGLE_UP if can_move_up? && @next == :up
    @triangle = TRIANGLE_DOWN if can_move_down? && @next == :down
    @triangle = TRIANGLE_LEFT if can_move_left? && @next == :left
    @triangle = TRIANGLE_RIGHT if can_move_right? && @next == :right
    SPEED.times do
      @y = y - 1 if moving_up? && can_move_up?
      @y = y + 1 if moving_down? && can_move_down?
      @x = x - 1 if moving_left? && can_move_left?
      @x = x + 1 if moving_right? && can_move_right?
    end
    @x = x % window.width
    @y = y % window.height
  end

  private

  SPEED = 3
  TRIANGLE_UP    = [[0, Pickman::CELL_SIZE], [Pickman::CELL_SIZE / 2, 0], [Pickman::CELL_SIZE, Pickman::CELL_SIZE]]
  TRIANGLE_DOWN  = [[0, 0], [Pickman::CELL_SIZE / 2, Pickman::CELL_SIZE], [Pickman::CELL_SIZE, 0]]
  TRIANGLE_LEFT  = [[Pickman::CELL_SIZE, 0], [0, Pickman::CELL_SIZE / 2], [Pickman::CELL_SIZE, Pickman::CELL_SIZE]]
  TRIANGLE_RIGHT = [[0, 0], [Pickman::CELL_SIZE, Pickman::CELL_SIZE / 2], [0, Pickman::CELL_SIZE]]

  attr_reader :x, :y, :triangle, :window, :maze
end