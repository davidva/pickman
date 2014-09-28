class RandomGhost
  include Character

  def initialize(window, maze)
    @window = window
    @maze = maze
    @x = Pickman::CELL_SIZE
    @y = Pickman::CELL_SIZE
    down
  end

  def update
    moves = [@next]
    if @next == :right
      moves << :up if can_move_up?
      moves << :down if can_move_down?
    elsif @next == :left
      moves << :up if can_move_up?
      moves << :down if can_move_down?
    elsif @next == :down
      moves << :left if can_move_left?
      moves << :right if can_move_right?
    elsif @next == :up
      moves << :left if can_move_left?
      moves << :right if can_move_right?
    end
    @next = moves.sample
    move
  end

  def draw
    window.draw_quad(x, y, Gosu::Color::GREEN,
                     x + Pickman::CELL_SIZE, y, Gosu::Color::GREEN,
                     x, y + Pickman::CELL_SIZE, Gosu::Color::GREEN,
                     x + Pickman::CELL_SIZE, y + Pickman::CELL_SIZE, Gosu::Color::GREEN,
                     Pickman::ZOrder::Ghost)
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