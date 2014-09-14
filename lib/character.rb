module Character
  SPEED = 3

  def up
    @next = :up
  end

  def down
    @next = :down
  end

  def left
    @next = :left
  end

  def right
    @next = :right
  end

  def can_move_up?
    can_move?(x, y - 1)
  end

  def can_move_down?
    can_move?(x, y + 1)
  end

  def can_move_left?;
    can_move?(x - 1, y)
  end

  def can_move_right?
    can_move?(x + 1, y)
  end

  def move
    SPEED.times do
      @y = y - 1 if moving_up? && can_move_up?
      @y = y + 1 if moving_down? && can_move_down?
      @x = x - 1 if moving_left? && can_move_left?
      @x = x + 1 if moving_right? && can_move_right?
    end
    @x = x % window.width
    @y = y % window.height
  end

  private

  def can_move?(x, y)
    Pickman.corners(x, y).none? { |(x, y)| maze.block?(x, y) }
  end
end
