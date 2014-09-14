class Ghost
  def initialize(window, maze)
    @window = window
    @maze = maze
    @x = Pickman::CELL_SIZE
    @y = Pickman::CELL_SIZE
  end

  def update
  end

  def draw
    window.draw_quad(x, y, Gosu::Color::RED,
                     x + Pickman::CELL_SIZE, y, Gosu::Color::RED,
                     x, y + Pickman::CELL_SIZE, Gosu::Color::RED,
                     x + Pickman::CELL_SIZE, y + Pickman::CELL_SIZE, Gosu::Color::RED,
                     ZOrder::Background)
  end

  private

  attr_reader :window, :maze, :x, :y
end