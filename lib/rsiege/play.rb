module RSiege
  class Play < Chingu::GameState
    trait :timer

    def setup
      @player ||= Player.create(factor: 1, alpha: 100, x: 200, y: 200)
      @goblin ||= KidGoblin.create(factor: 1, alpha: 100, x: 300, y: 300)
    end

    def update
      super
    end

    def draw
      fill(Gosu::Color::BLACK)
      super
    end
  end
end
