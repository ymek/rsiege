require 'chingu'

module RSiege
  include Chingu

  path = File.expand_path(File.dirname(__FILE__))
  autoload :Actor,  File.join(path, 'rsiege', 'actor')
  autoload :Player, File.join(path, 'rsiege', 'player')
  autoload :KidGoblin, File.join(path, 'rsiege', 'kid_goblin')
  autoload :Gmenu,  File.join(path, 'rsiege', 'gmenu')
  autoload :GameMenu, File.join(path, 'rsiege', 'game_menu')
  autoload :Menu,   File.join(path, 'rsiege', 'menu')
  autoload :Play,   File.join(path, 'rsiege', 'play')
  autoload :Game,   File.join(path, 'rsiege', 'game')
end
