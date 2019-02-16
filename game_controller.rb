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

  private

  def run
    loop do
      @interface.show_game_screen(@game.dealer, @game.user)
      @interface.show_actions
      choice = @interface.user_choice(ACTIONS_MENU.size)
      @interface.show_msg(INVALID_CHOICE) unless choice
      case choice
      when 1 then action_skip
      end
    end
  end

  def setup
    @interface.show_msg(WELCOME_MESSAGE)
    @interface.show_menu(START_MENU)
    choice = @interface.user_choice(START_MENU.size)
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

  def action_skip
    @game.dealer.move
  end
end