class PickmanWindow < Gosu::Window
  def initialize
    super(Background::CELL_SIZE * 28, Background::CELL_SIZE * 31, false)
    self.caption = 'Picman'

    @background = Background.new(self)
  end

  def update
  end

  def draw
    background.draw
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  private

  attr_reader :background
end
