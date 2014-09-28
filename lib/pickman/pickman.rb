module Pickman
  CELL_SIZE = 24

  class Window < Gosu::Window
    def initialize
      super(CELL_SIZE * Maze::NUM_COLS, CELL_SIZE * Maze::NUM_ROWS, false)
      self.caption = 'Pickman'

      @maze = Maze.new(self)
      @me = Me.new(self, maze)
      @characters = [@me, OuterGhost.new(self, maze), RandomGhost.new(self, maze)]
    end

    def update
      me.left  if button_down?(Gosu::KbLeft)
      me.right if button_down?(Gosu::KbRight)
      me.down  if button_down?(Gosu::KbDown)
      me.up    if button_down?(Gosu::KbUp)
      characters.each(&:update)
    end

    def draw
      maze.draw
      characters.each(&:draw)
    end

    def button_down(id)
      close if id == Gosu::KbEscape
    end

    private

    attr_reader :me, :maze, :characters
  end

  module ZOrder
    Background, Pill, Ghost, Me, UI = *0..3
  end
end
