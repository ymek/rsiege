module RSiege
  class Menu < Chingu::GameState
    def setup
      menu = GameMenu.create(menu_items: { "Play" => Play, "Exit" => :exit })
    end

    def update
      super
    end

    def draw
      super
    end
  end
end
