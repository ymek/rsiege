module RSiege

  #
  # When you want a quick 'n dirty menu, SimpleMenu might help.
  # Basic usage:
  #   SimpleMenu.create(:menu_items => {"StartGame" => PlayState, "Edit" => :exit})
  #
  # It will catch keys :up, :down, :return and :space and navigate through the menu
  #
  class Gmenu < Chingu::BasicGameObject
    include Chingu::Helpers::InputClient
    include Chingu::Helpers::GFX

    attr_accessor :menu_items, :visible

    def initialize(options = {})
      super

      # @font_size = options.delete(:font_size) || 30
      @menu_items = options.delete(:menu_items)
      @x = options.delete(:x) || $window.width/2
      @y = options.delete(:y) || 0
      @spacing = options.delete(:spacing) || 100
      @items = []
      @visible = true

      y = @y
      menu_items.each do |key, value|
        item = if key.is_a? String
          Chingu::Text.new(key, options.dup.merge(font: 'verdana', size: 24))
        elsif key.is_a? Gosu::Image
          Chingu::GameObject.new(options.merge!(:image => key))
        elsif key.is_a? Chingu::GameObject
          key.options.merge!(options.dup)
          key
        end

        item.options[:on_select] = method(:on_select)
        item.options[:on_deselect] = method(:on_deselect)
        item.options[:action] = value

        item.rotation_center = :center_top
        item.x = @x
        item.y = y
        y += item.height + @spacing
        @items << item
      end
      @selected = options[:selected] || 0
      step(0)

      self.input = {:up => lambda{step(-1)}, :down => lambda{step(1)}, [:return, :space] => :select}
    end

    #
    # Moves selection within the menu. Can be called with negative or positive values. -1 and 1 makes most sense.
    #
    def step(value)
      selected.options[:on_deselect].call(selected)
      @selected += value
      @selected = @items.count-1  if @selected < 0
      @selected = 0               if @selected == @items.count
      selected.options[:on_select].call(selected)
    end

    def select
      dispatch_action(selected.options[:action], self.parent)
    end

    def selected
      @items[@selected]
    end

    def on_deselect(object)
      object.color = ::Gosu::Color::WHITE
    end

    def on_select(object)
      object.color = ::Gosu::Color::RED
    end

    def draw
      @items.each { |item| item.draw }
    end

    private

    #
    # TODO - DRY this up with input dispatcher somehow
    #
    def dispatch_action(action, object)
      case action
      when Symbol, String
        object.send(action)
      when Proc, Method
        action[]
      when Chingu::GameState
        game_state.push_game_state(action)
      when Class
        if action.ancestors.include?(Chingu::GameState)
          game_state.push_game_state(action)
        end
      else
        # TODO possibly raise an error? This ought to be handled when the input is specified in the first place.
      end
    end
  end


end

