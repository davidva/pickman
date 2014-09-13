class Pickman
  def initialize(window)
    @window = window
    @row = 1
    @col = 1
  end

  def draw
    window.draw_triangle(row * Background::CELL_SIZE,
                         col * Background::CELL_SIZE,
                         Gosu::Color::YELLOW,
                         row * Background::CELL_SIZE + Background::CELL_SIZE,
                         col * Background::CELL_SIZE + Background::CELL_SIZE / 2,
                         Gosu::Color::YELLOW,
                         row * Background::CELL_SIZE,
                         col * Background::CELL_SIZE + Background::CELL_SIZE,
                         Gosu::Color::YELLOW,
                         ZOrder::Pickman)
  end

  private

  attr_reader :window, :row, :col
end