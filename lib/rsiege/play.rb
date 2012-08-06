module RSiege
  class Play < Chingu::GameState
    trait :timer

    def setup
      @player ||= Player.create(factor: 1, alpha: 100, x: 200, y: 200)
      @square = fill_rect([10,10,100,100], Gosu::Color::WHITE)
    end

    def update
      super
    end

    def draw
      #fill(Gosu::Color::BLACK)
      super
    end
  end
end
