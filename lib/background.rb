class Background
  COLOR = 0xff4444ff
  CELL_SIZE = 23
  CELL_SPACING = 2

  def initialize(window, map)
    @window = window
    @map = map
  end

  def draw
    (0...map.num_cols).each do |col|
      (0...map.num_rows).each do |row|
        cell = map.cell_at(row, col)
        draw_cell_at(row, col) if cell == 1
      end
    end
  end

  private

  attr_reader :window, :map

  def draw_cell_at(row, col)
    window.draw_quad(col * CELL_SIZE + CELL_SPACING,
                     row * CELL_SIZE + CELL_SPACING,
                     COLOR,
                     col * CELL_SIZE + CELL_SIZE - CELL_SPACING,
                     row * CELL_SIZE + CELL_SPACING,
                     COLOR,
                     col * CELL_SIZE + CELL_SPACING,
                     row * CELL_SIZE + CELL_SIZE - CELL_SPACING,
                     COLOR,
                     col * CELL_SIZE + CELL_SIZE - CELL_SPACING,
                     row * CELL_SIZE + CELL_SIZE - CELL_SPACING,
                     COLOR,
                     ZOrder::Background)
  end
end