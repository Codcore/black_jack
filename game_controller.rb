require_relative 'interface'
require_relative 'interface_messages'
require_relative 'game'

class GameController
  include InterfaceMessages

  def initialize
    @interface = Interface.new
    setup
    run
  end

  def run
    @interface.show_hands(@game.user.name,
                          @game.user.hand.to_s,
                          @game.dealer.hand.to_s)
  end

  def setup
    @interface.show_msg(WELCOME_MESSAGE)
    @interface.show_menu(START_MENU)
    return if @interface.user_choice == 2

    @interface.show_prompt(USER_NAME_PROMPT)
    @game = Game.new(@interface.user_input)
  end
end