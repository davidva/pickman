class Maze
  NUM_ROWS = 31
  NUM_COLS = 28

  def initialize(window)
    @window = window
  end

  def draw
    (0...NUM_COLS).each do |col|
      (0...NUM_ROWS).each do |row|
        draw_cell_at(row, col) if CELLS[row][col] == '#'
      end
    end
  end

  def block?(x, y)
    row = y / Pickman::CELL_SIZE
    col = x / Pickman::CELL_SIZE
    CELLS[row][col] == '#' || CELLS[row][col] == '_'
  end

  private

  CELLS = [
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
    '....##.##..........##.##....'.chars,
    '....##.##.###__###.##.##....'.chars,
    '######.##.#......#.##.######'.chars,
    '..........#......#..........'.chars,
    '######.##.#......#.##.######'.chars,
    '....##.##.########.##.##....'.chars,
    '....##.##..........##.##....'.chars,
    '....##.##.########.##.##....'.chars,
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

  COLOR = 0xff4444ff
  CELL_SPACING = 2

  attr_reader :window

  def draw_cell_at(row, col)
    window.draw_quad(col * Pickman::CELL_SIZE + CELL_SPACING,
                     row * Pickman::CELL_SIZE + CELL_SPACING,
                     COLOR,
                     col * Pickman::CELL_SIZE + Pickman::CELL_SIZE - CELL_SPACING,
                     row * Pickman::CELL_SIZE + CELL_SPACING,
                     COLOR,
                     col * Pickman::CELL_SIZE + CELL_SPACING,
                     row * Pickman::CELL_SIZE + Pickman::CELL_SIZE - CELL_SPACING,
                     COLOR,
                     col * Pickman::CELL_SIZE + Pickman::CELL_SIZE - CELL_SPACING,
                     row * Pickman::CELL_SIZE + Pickman::CELL_SIZE - CELL_SPACING,
                     COLOR,
                     ZOrder::Background)
  end
end