module Pickman
  class Pill
    def self.buildPills(window)
      pills = []
      (0...NUM_COLS).each do |col|
        (0...NUM_ROWS).each do |row|
          pills << Pill.new(window, col, row) if MAP[row][col] == '.'
        end
      end
      pills
    end

    def initialize(window, x, y)
      @window = window
      @x = CELL_SIZE * x
      @y = CELL_SIZE * y
    end

    def draw
      window.draw_quad(x + 9, y + 9, Gosu::Color::YELLOW,
                       x + CELL_SIZE - 9, y + 9, Gosu::Color::YELLOW,
                       x + 9, y + CELL_SIZE - 9, Gosu::Color::YELLOW,
                       x + CELL_SIZE - 9, y + CELL_SIZE - 9, Gosu::Color::YELLOW,
                       ZOrder::Pill)
    end

    private

    attr_reader :window, :x, :y
  end
end
