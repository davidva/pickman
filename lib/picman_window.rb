class PicmanWindow < Gosu::Window
  def initialize
    super(800, 600, false)
    self.caption = "Gosu Tutorial Game"

    @background_image = Gosu::Image.new(self, "media/space.png", true)
    @player = Player.new(self)
    @player.warp(320, 240)
  end

  def update
    @player.turn_left  if button_down?(Gosu::KbLeft) || button_down?(Gosu::GpLeft)
    @player.turn_right if button_down?(Gosu::KbRight) || button_down?(Gosu::GpRight)
    @player.accelerate if button_down?(Gosu::KbUp) || button_down?(Gosu::GpButton0)

    @player.move
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end
