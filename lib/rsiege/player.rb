module RSiege
  ##
  # FIXME: Something is wonky with the animations
  class Player < Actor
    trait :velocity
    trait :animation, alpha: 100, delay: 200, size: [32, 48]

    def setup
      self.input = {
        holding_left: :move_left,
        holding_right: :move_right,
        holding_up: :move_up,
        holding_down: :move_down
      }
      #@animation = self.animations[:default].first
    end

    def update
      @image = @animation.next if @animation.respond_to?(:next)
      @animation = self.animations[:default].first unless moved?
    end

    private
    def move_left
      @animation = self.animations[:left] if self.animations[:left]
      move(-1, 0)
    end

    def move_right
      @animation = self.animations[:right] if self.animations[:right]
      move(1, 0)
    end

    def move_up
      @animation = self.animations[:up] if self.animations[:up]
      move(0, -1)
    end

    def move_down
      @animation = self.animations[:down] if self.animations[:down]
      move(0, 1)
    end

    def move(x, y)
      self.x += x
      self.y += y
    end
  end
end
