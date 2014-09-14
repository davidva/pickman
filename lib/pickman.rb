class Pickman
  def initialize(window)
    @x = Background::CELL_SIZE
    @y = Background::CELL_SIZE
    @window = window
    right
  end

  def draw
    window.draw_triangle(x + triangle[0][0], y + triangle[0][1], Gosu::Color::YELLOW,
                         x + triangle[1][0], y + triangle[1][1], Gosu::Color::YELLOW,
                         x + triangle[2][0], y + triangle[2][1], Gosu::Color::YELLOW,
                         ZOrder::Pickman)
  end

  def up
    @triangle = TRIANGLE_UP
  end

  def down
    @triangle = TRIANGLE_DOWN
  end

  def left
    @triangle = TRIANGLE_LEFT
  end

  def right
    @triangle = TRIANGLE_RIGHT
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

  def move
    @y = y - SPEED if moving_up?
    @y = y + SPEED if moving_down?
    @x = x - SPEED if moving_left?
    @x = x + SPEED if moving_right?
  end

  private

  SPEED = 2
  TRIANGLE_UP    = [[0, Background::CELL_SIZE], [Background::CELL_SIZE / 2, 0], [Background::CELL_SIZE, Background::CELL_SIZE]]
  TRIANGLE_DOWN  = [[0, 0], [Background::CELL_SIZE / 2, Background::CELL_SIZE], [Background::CELL_SIZE, 0]]
  TRIANGLE_LEFT  = [[Background::CELL_SIZE, 0], [0, Background::CELL_SIZE / 2], [Background::CELL_SIZE, Background::CELL_SIZE]]
  TRIANGLE_RIGHT = [[0, 0], [Background::CELL_SIZE, Background::CELL_SIZE / 2], [0, Background::CELL_SIZE]]

  attr_reader :x, :y, :triangle, :window
end