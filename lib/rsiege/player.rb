module RSiege
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

      @frame_name = :default
      @last_x, @last_y = @x, @y
    end

    def update
      if moved?
        @image = self.animations[@frame_name].next
      else
        @image = self.animations[@frame_name].first
      end

      @last_x, @last_y = @x, @y
    end

    private
    def move_left
      @frame_name = :left
      move(-1, 0)
    end

    def move_right
      @frame_name = :right
      move(1, 0)
    end

    def move_up
      @frame_name = :up
      move(0, -1)
    end

    def move_down
      @frame_name = :down
      move(0, 1)
    end

    def moved?
      @last_x != @x || @last_y != @y
    end
  end
end
