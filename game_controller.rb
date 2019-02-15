require_relative 'interface'
require_relative 'interface_messages'

class GameController
  include InterfaceMessages

  def initialize
    @interface = Interface.new
    setup
  end

  def run; end

  def setup
    @interface.show_msg(WELCOME_MESSAGE)
    @interface.show_menu(START_MENU)
    return if @interface.user_choice == 2

    @interface.show_prompt(USER_NAME_PROMPT)
    @game = Game.new(@interface.user_input)
  end
end