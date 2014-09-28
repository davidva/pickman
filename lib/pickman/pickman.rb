module Pickman
  CELL_SIZE = 24

  MAP = [
    '############################'.chars,
    '#..........................#'.chars,
    '#.####.#####.##.#####.####.#'.chars,
    '#.####.#####.##.#####.####.#'.chars,
    '#.####.#####.##.#####.####.#'.chars,
    '#..........................#'.chars,
    '#.####.##.########.##.####.#'.chars,
    '#.####.##.########.##.####.#'.chars,
    '#......##....##....##......#'.chars,
    '######.#####.##.#####.######'.chars,
    '######.#####.##.#####.######'.chars,
    '    ##.##..........##.##    '.chars,
    '    ##.##.###__###.##.##    '.chars,
    '######.##.#      #.##.######'.chars,
    '..........#      #..........'.chars,
    '######.##.#      #.##.######'.chars,
    '    ##.##.########.##.##    '.chars,
    '    ##.##..........##.##    '.chars,
    '    ##.##.########.##.##    '.chars,
    '######.##.########.##.######'.chars,
    '#............##............#'.chars,
    '#.####.#####.##.#####.####.#'.chars,
    '#.####.#####.##.#####.####.#'.chars,
    '#...##................##...#'.chars,
    '###.##.##.########.##.##.###'.chars,
    '###.##.##.########.##.##.###'.chars,
    '#......##....##....##......#'.chars,
    '#.##########.##.##########.#'.chars,
    '#.##########.##.##########.#'.chars,
    '#..........................#'.chars,
    '############################'.chars
  ]

  NUM_ROWS = 31
  NUM_COLS = 28

  class Window < Gosu::Window
    def initialize
      super(CELL_SIZE * NUM_COLS, CELL_SIZE * NUM_ROWS, false)
      self.caption = 'Pickman'

      @maze = Maze.new(self)
      @pills = Pill.buildPills(self)
      @me = Character::Me.new(self, maze)
      @characters = [@me, Character::OuterGhost.new(self, maze), Character::RandomGhost.new(self, maze)]
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
      pills.each(&:draw)
      characters.each(&:draw)
    end

    def button_down(id)
      close if id == Gosu::KbEscape
    end

    private

    attr_reader :me, :maze, :characters, :pills
  end

  module ZOrder
    Background, Pill, Ghost, Me, UI = *0..3
  end
end
