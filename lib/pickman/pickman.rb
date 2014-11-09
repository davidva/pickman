module Pickman
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

  CELL_SIZE = 24

  NUM_ROWS = 31
  NUM_COLS = 28

  class Window < Gosu::Window
    def initialize
      super(CELL_SIZE * NUM_COLS, CELL_SIZE * NUM_ROWS, false)
      self.caption = 'Pickman'

      @maze = Maze.new(self)
      @me = Character::Me.new(self, maze)
      @pills = Pill.buildPills(self)
      @ghosts = Character::OuterGhost.new(self, maze), Character::RandomGhost.new(self, maze)
      @ui = UI.new(self)
      @lives = 3
      @score = 0
    end

    def update
      me.left  if button_down?(Gosu::KbLeft)
      me.right if button_down?(Gosu::KbRight)
      me.down  if button_down?(Gosu::KbDown)
      me.up    if button_down?(Gosu::KbUp)
      pills.each(&:update)
      ghosts.each(&:update)
      me.update
      pill_eaten = pills.detect { |pill| me_here?(pill) }
      if pill_eaten
        @score += 25
        pills.delete(pill_eaten)
      end
      killer = ghosts.detect { |ghost| me_here?(ghost) }
      @lives -= 1 if killer
    end

    def draw
      maze.draw
      pills.each(&:draw)
      ghosts.each(&:draw)
      me.draw
      ui.draw(lives, score, pills.count)
    end

    def button_down(id)
      close if id == Gosu::KbEscape
    end

    private

    attr_reader :me, :maze, :ghosts, :pills, :ui, :lives, :score

    def me_here?(other)
      me.x == other.x && me.y == other.y
    end
  end

  module ZOrder
    Background, Pill, Ghost, Me, UI = *0..4
  end
end
