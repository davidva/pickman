class PickmanWindow < Gosu::Window
  def initialize
    super(Pickman::CELL_SIZE * Maze::NUM_COLS, Pickman::CELL_SIZE * Maze::NUM_ROWS, false)
    self.caption = 'Pickman'

    @maze = Maze.new(self)
    @ghost = Ghost.new(self, maze)
    @me = Me.new(self, maze)
  end

  def update
    ghost.update
    me.left  if button_down?(Gosu::KbLeft)
    me.right if button_down?(Gosu::KbRight)
    me.down  if button_down?(Gosu::KbDown)
    me.up    if button_down?(Gosu::KbUp)
    me.update
  end

  def draw
    maze.draw
    ghost.draw
    me.draw
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  private

  attr_reader :me, :maze, :ghost
end
