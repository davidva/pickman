module Pickman
  class Maze
    def initialize(window)
      @window = window
    end

    def draw
      (0...NUM_COLS).each do |col|
        (0...NUM_ROWS).each do |row|
          draw_cell_at(row, col) if MAP[row][col] == '#'
        end
      end
    end

    def block?(x, y)
      row = y / CELL_SIZE
      col = x / CELL_SIZE
      MAP[row][col] == '#' || MAP[row][col] == '_'
    end

    private

    COLOR = 0xff4444ff
    CELL_SPACING = 2

    attr_reader :window

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
end
