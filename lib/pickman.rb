module Pickman
  CELL_SIZE = 24

  def self.corners(x, y)
    [[x, y], [x + CELL_SIZE - 1, y], [x, y + CELL_SIZE - 1], [x + CELL_SIZE - 1, y + CELL_SIZE - 1]]
  end
end
