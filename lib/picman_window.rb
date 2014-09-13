class PicmanWindow < Gosu::Window
  def initialize
    super(800, 600, false)
    self.caption = "Gosu Tutorial Game"

    @background_image = Gosu::Image.new(self, "media/space.png", true)
  end

  def update
  end

  def draw
    @background_image.draw(0, 0, 0)
  end
end
