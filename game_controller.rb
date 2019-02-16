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
      @interface.show_game_screen(@dealer, @user)
      @interface.show_actions
      choice = @interface.user_choice(ACTIONS_MENU.size)
      @interface.show_msg(INVALID_CHOICE) unless choice
      case choice
      when 1 then action_skip
      when 2 then action_pull_card
      when 3 then action_open_cards
      else next
      end
      game_over(determine_winner) if @user.hand.full? && @dealer.hand.full?
    end
  end

  def setup
    @interface.show_msg(WELCOME_MESSAGE)
    @interface.show_menu(START_MENU)
    choice = @interface.user_choice(START_MENU.size)
    case choice
    when 1
      @interface.show_prompt(USER_NAME_PROMPT)
      @game   = Game.new(@interface.user_input)
      @user   = @game.user
      @dealer = @game.dealer
    when 2 then return
    else
      @interface.show_msg(INVALID_CHOICE)
      setup
    end
  end

  def action_skip
    @dealer.move
    game_over(@user) if @dealer.points > 21
  end

  def action_pull_card
    @user.hand.pull_card(CardDeck.instance.draw_card)
    game_over(@dealer) if @user.points > 21
  end

  def action_open_cards
    @dealer.hand.visible = true
    game_over(determine_winner)
  end

  def determine_winner
    return nil if @dealer.points == @user.points

    #TODO: BLACK_JACK module
    21 - @user.points < 21 - @dealer.points ? @user : @dealer
  end

  def game_over(winner)
    @dealer
    @interface.show_msg("#{winner.name.upcase} IS WIN!!!")
    #TODO: merge to one method
    @interface.show_menu(GAME_OVER_MENU)
    choice = @interface.user_choice(GAME_OVER_MENU.size)
    case choice
    when 1
      CardDeck.instance.refresh
      return
    when 2
      exit
    end
  end
end