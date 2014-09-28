module Pickman
  class UI
    def initialize(window, me)
      @me = me
      @font = Gosu::Font.new(window, Gosu::default_font_name, 20)
    end

    def draw
      font.draw("Lives: 3   Score: #{me.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
    end

    private

    attr_reader :me, :font
  end
end
