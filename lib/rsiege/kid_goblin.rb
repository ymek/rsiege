module RSiege
  class KidGoblin < Actor
    trait :animation, alpha: 100, delay: 200, size: [24, 24]

    def setup
      @frame_name = :default
    end

    def update
      @image = self.animations[@frame_name].next
    end
  end
end
