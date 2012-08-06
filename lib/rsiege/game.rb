module RSiege
  class Game < Chingu::Window
    def initialize
      super(640, 480)
      self.input = {
        escape: :toggle_menu,
        space: :exit,
      }
      switch_game_state(Menu)
      transitional_game_state(Chingu::GameStates::FadeTo, speed: 5, debug: true)
    end

    def toggle_menu
      if current_game_state.is_a?(Menu)
        switch_game_state(@play_state) if @play_state
      elsif current_game_state.is_a?(Play)
        @play_state = current_game_state
        switch_game_state(Menu, finalize: false)
      end
    end
  end
end
