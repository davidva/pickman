class PicmanWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = "Gosu Tutorial Game"

    @background_image = Gosu::Image.new(self, "media/space.png", true)
    @player = Player.new(self)
    @player.warp(320, 240)

    @star_anim = Gosu::Image::load_tiles(self, "media/star.png", 25, 25, false)
    @stars = Array.new
  end

  def update
    @player.turn_left  if button_down?(Gosu::KbLeft) || button_down?(Gosu::GpLeft)
    @player.turn_right if button_down?(Gosu::KbRight) || button_down?(Gosu::GpRight)
    @player.accelerate if button_down?(Gosu::KbUp) || button_down?(Gosu::GpButton0)

    @player.move
    @player.collect_stars(@stars)

    @stars.push(Star.new(@star_anim)) if rand(100) < 4 and @stars.size < 25
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, ZOrder::Background)
    @stars.each { |star| star.draw }
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end
