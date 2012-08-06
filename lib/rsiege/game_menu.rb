module RSiege
  class GameMenu < Gmenu
    def on_deselect(object)
      object.color = Gosu::Color::WHITE
    end

    def on_select(object)
      object.color = Gosu::Color::RED
    end
  end
end
