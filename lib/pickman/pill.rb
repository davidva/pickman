module Pickman
  class Pill
    attr_reader :x, :y

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

    def update
    end

    def draw
      window.draw_quad(x + 8, y + 8, Gosu::Color::YELLOW,
                       x + CELL_SIZE - 8, y + 8, Gosu::Color::YELLOW,
                       x + 8, y + CELL_SIZE - 8, Gosu::Color::YELLOW,
                       x + CELL_SIZE - 8, y + CELL_SIZE - 8, Gosu::Color::YELLOW,
                       ZOrder::Pill)
    end

    private

    attr_reader :window
  end
end
