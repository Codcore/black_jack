require_relative 'interface'
require_relative 'interface_messages'
require_relative 'game'
require_relative 'card_deck'

class GameController
  include InterfaceMessages

  def initialize
    @interface = Interface.new
    setup
    run
  end

  def run
    @interface.show_game_screen(@game.dealer, @game.user)
    @interface.show_actions
  end

  def setup
    @interface.show_msg(WELCOME_MESSAGE)
    @interface.show_menu(START_MENU)
    choice = @interface.user_choice
    case choice
    when 2 then return
    when 1
      @interface.show_prompt(USER_NAME_PROMPT)
      @game = Game.new(@interface.user_input)
    else
      @interface.show_msg(INVALID_CHOICE)
      setup
    end
  end
end