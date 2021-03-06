module Pickman
  class Character::Me
    include Character

    def initialize(window, maze)
      @x = CELL_SIZE
      @y = CELL_SIZE
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

    def update
      @triangle = TRIANGLE_UP if can_move_up? && @next == :up
      @triangle = TRIANGLE_DOWN if can_move_down? && @next == :down
      @triangle = TRIANGLE_LEFT if can_move_left? && @next == :left
      @triangle = TRIANGLE_RIGHT if can_move_right? && @next == :right
      move
    end

    private

    TRIANGLE_UP    = [[0, CELL_SIZE], [CELL_SIZE / 2, 0], [CELL_SIZE, CELL_SIZE]]
    TRIANGLE_DOWN  = [[0, 0], [CELL_SIZE / 2, CELL_SIZE], [CELL_SIZE, 0]]
    TRIANGLE_LEFT  = [[CELL_SIZE, 0], [0, CELL_SIZE / 2], [CELL_SIZE, CELL_SIZE]]
    TRIANGLE_RIGHT = [[0, 0], [CELL_SIZE, CELL_SIZE / 2], [0, CELL_SIZE]]

    attr_reader :triangle, :window, :maze
  end
end
