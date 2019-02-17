require_relative 'interface'
require_relative 'interface_messages'
require_relative 'game'
require_relative 'card_deck'
require_relative 'black_jack'

class GameController
  include InterfaceMessages
  include BlackJack

  def initialize
    @interface = Interface.new
    init
    run
  end

  private

  def set_up
    @game   = Game.new(@user_name)
    @user   = @game.user
    @dealer = @game.dealer
    @bank   = @game.bank
    make_bets
  end

  def make_bets
    @bank.receive(@user.bank.bet)
    @bank.receive(@dealer.bank.bet)
  end

  def try_again_set_up(winner)
    if winner
      winner.bank.receive(@bank.give_cash)
    else
      cash = @bank.give_cash
      @dealer.bank.receive(cash / 2)
      @user.bank.receive(cash / 2)
    end
    end_game(@user) if @user.bank.empty?
    end_game(@dealer) if @dealer.bank.empty?
    @dealer.reset_hand
    @user.reset_hand
    make_bets
    @game.card_deck.refresh
    @interface.refresh_menu_items
  end

  def run
    loop do
      cls
      @interface.show_game_screen(@dealer, @user)
      menu = @interface.compose_actions_menu
      choice = process_empty_choice(@interface.show_menu_and_get_input(menu), menu)
      case choice
      when ACTIONS_MENU[0] then action_skip
      when ACTIONS_MENU[1] then action_pull_card
      when ACTIONS_MENU[2] then action_open_cards
      else return
      end
      game_over(nil) if @user.points == @dealer.points
      game_over(@user, true) if @user.points == BLACK_JACK

      game_over(winner) if @user.hand.full? && @dealer.hand.full?
    end
  end

  def init(clear = true)
    cls if clear
    @interface.show_msg(WELCOME_MESSAGE)
    choice = @interface.show_menu_and_get_input(START_MENU)
    case choice
    when START_MENU[0]
      system('clear')
      @user_name = @interface.show_prompt_and_get_input(USER_NAME_PROMPT)
      set_up
    when START_MENU[1] then return
    else
      @interface.show_msg(INVALID_CHOICE)
      init(false)
    end
  end

  def action_skip
    @interface.actions_menu_items = [1, 2] if @dealer.hand.full?
    @dealer.move
    game_over(@user) if @dealer.points > BLACK_JACK
    @interface.actions_menu_items = [1, 2]
  end

  def action_pull_card
    @interface.actions_menu_items = [2]
    @user.hand.pull_card(@game.card_deck.draw_card)
    game_over(@dealer) if @user.points > BLACK_JACK
  end

  def action_open_cards
    @dealer.hand.visible = true
    game_over(winner)
  end

  def winner
    @game.determine_winner
  end

  def game_over(winner, black_jack = false)
    cls
    @dealer.hand.visible = true
    @interface.show_game_screen(@dealer, @user)
    if black_jack
      @interface.show_msg('BlackJack - you win!!!'.upcase)
    elsif winner
      @interface.show_msg("#{@user.name}, you win!!!".upcase) if winner.is_a? User
      @interface.show_msg("#{@user.name}, you loose... =(") if winner.is_a? Dealer
    else
      @interface.show_msg('DRAW!')
    end

    choice = process_empty_choice(@interface.show_menu_and_get_input(GAME_OVER_MENU), GAME_OVER_MENU)
    case choice
    when GAME_OVER_MENU[0]
      try_again_set_up(winner)
    when GAME_OVER_MENU[1] then exit
    else exit
    end
  end

  def end_game(looser)
    cls
    @interface.show_empty_bank_msg(looser)
    winner = [@user, @dealer].delete(looser)
    @interface.show_msg('You spent all your money and go home with empty pockets... =(') if winner.is_a? User
    @interface.show_msg('You win a game!!! Now you can buy a yacht!!!'.upcase) if winner.is_a? Dealer
    init(false)
  end

  def process_empty_choice(choice, _menu)
    until choice
      system('clear')
      @interface.show_msg(INVALID_CHOICE)
      @interface.show_game_screen(@dealer, @user)
      choice = @interface.show_menu_and_get_input(GAME_OVER_MENU)
    end
    choice
  end

  def cls
    system('clear')
  end
end
