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
    @interface.show_screen(@game.dealer, @game.user)
  end

  def setup
    @interface.show_msg(WELCOME_MESSAGE)
    @interface.show_menu(START_MENU)
    return if @interface.user_choice == 2

    @interface.show_prompt(USER_NAME_PROMPT)
    @game = Game.new(@interface.user_input)
  end
end