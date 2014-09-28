module Pickman
  class OuterGhost
    include Character

    def initialize(window, maze)
      @window = window
      @maze = maze
      @x = CELL_SIZE
      @y = CELL_SIZE
      down
    end

    def update
      if @next == :right && !can_move_right?
        @next = :left if can_move_left?
        @next = :up if can_move_up?
        @next = :down if can_move_down?
      elsif @next == :left && !can_move_left?
        @next = :right if can_move_right?
        @next = :down if can_move_down?
        @next = :up if can_move_up?
      elsif @next == :down && !can_move_down?
        @next = :up if can_move_up?
        @next = :right if can_move_right?
        @next = :left if can_move_left?
      elsif @next == :up && !can_move_up?
        @next = :down if can_move_down?
        @next = :right if can_move_right?
        @next = :left if can_move_left?
      end
      move
    end

    def draw
      window.draw_quad(x, y, Gosu::Color::RED,
                       x + CELL_SIZE, y, Gosu::Color::RED,
                       x, y + CELL_SIZE, Gosu::Color::RED,
                       x + CELL_SIZE, y + CELL_SIZE, Gosu::Color::RED,
                       ZOrder::Ghost)
    end

    private

    attr_reader :window, :maze, :x, :y

    def moving_up?
      @next == :up
    end

    def moving_down?
      @next == :down
    end

    def moving_left?
      @next == :left
    end

    def moving_right?
      @next == :right
    end
  end
end