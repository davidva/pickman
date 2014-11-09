module Pickman
  class UI
    def initialize(window)
      @font = Gosu::Font.new(window, Gosu::default_font_name, 20)
    end

    def draw(lives, score, remaining)
      font.draw("Lives: #{lives}   Score: #{score}   Remaining: #{remaining}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
    end

    private

    attr_reader :font
  end
end
