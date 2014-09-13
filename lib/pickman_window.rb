class PickmanWindow < Gosu::Window
  def initialize
    map = Map.new
    super(Background::CELL_SIZE * map.num_cols, Background::CELL_SIZE * map.num_rows, false)
    self.caption = 'Picman'

    @background = Background.new(self, map)
    @pickman = Pickman.new(self)
  end

  def update
  end

  def draw
    background.draw
    pickman.draw
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  private

  attr_reader :background, :pickman
end
