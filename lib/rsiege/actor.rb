module RSiege
  class Actor < GameObject
    def setup
      @image = Gosu::Image["#{self.filename}.png"]
      @zorder = 10
    end
  end
end
