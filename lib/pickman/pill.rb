module Pickman
  class Pill
    def self.buildPills(window, me)
      pills = []
      (0...NUM_COLS).each do |col|
        (0...NUM_ROWS).each do |row|
          pills << Pill.new(window, col, row, me) if MAP[row][col] == '.'
        end
      end
      pills
    end

    def initialize(window, x, y, me)
      @window = window
      @x = CELL_SIZE * x
      @y = CELL_SIZE * y
      @me = me
      @eaten = false
    end

    def update
      return if eaten
      @eaten = true if is_me_here?
    end

    def draw
      return if eaten
      window.draw_quad(x + 8, y + 8, Gosu::Color::YELLOW,
                       x + CELL_SIZE - 8, y + 8, Gosu::Color::YELLOW,
                       x + 8, y + CELL_SIZE - 8, Gosu::Color::YELLOW,
                       x + CELL_SIZE - 8, y + CELL_SIZE - 8, Gosu::Color::YELLOW,
                       ZOrder::Pill)
    end

    private

    attr_reader :window, :x, :y, :me, :eaten

    def is_me_here?
      me.x == x && me.y == y
    end

    def can_move?(x, y)
      corners(x, y).none? { |(x, y)| maze.block?(x, y) }
    end

    def corners(x, y)
      [[x, y], [x + CELL_SIZE - 1, y], [x, y + CELL_SIZE - 1], [x + CELL_SIZE - 1, y + CELL_SIZE - 1]]
    end
  end
end
