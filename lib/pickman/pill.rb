module Pickman
  class Pill
    def initialize(window, x, y)
      @window = window
      @x = CELL_SIZE * x
      @y = CELL_SIZE * y
    end

    def update
      # moves = [@next]
      # if @next == :right
      #   moves << :up if can_move_up?
      #   moves << :down if can_move_down?
      # elsif @next == :left
      #   moves << :up if can_move_up?
      #   moves << :down if can_move_down?
      # elsif @next == :down
      #   moves << :left if can_move_left?
      #   moves << :right if can_move_right?
      # elsif @next == :up
      #   moves << :left if can_move_left?
      #   moves << :right if can_move_right?
      # end
      # @next = moves.sample
      # move
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
