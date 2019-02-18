module InterfaceMessages
  LIMITER_END      = '╚══════════════════════════════════════════════════════════════╝'.freeze
  LIMITER_START    = '╔══════════════════════════════════════════════════════════════╗'.freeze
  LIMITER_MIDDLE   = '╠══════════════════════════════════════════════════════════════╣'.freeze
  WELCOME_MESSAGE  = '⤛  Welcome to the BLACK JACK ⤜'.freeze
  USER_NAME_PROMPT = 'Enter your name'.freeze
  INVALID_CHOICE   = 'ERROR: Invalid choice. Try again'.upcase.freeze
  BLACK_JACK_MSG = 'BlackJack - you win!!!'.upcase.freeze
  DRAW_MSG = 'DRAW!'.freeze

  START_MENU = [
    'Start game',
    'Quit game'
  ].freeze

  ACTIONS_MENU = {
    skip: 'Skip',
    pull_card: 'Pull card',
    open_cards: 'Open cards'
  }.freeze

  GAME_OVER_MENU = [
    'Try again',
    'Exit'
  ].freeze
end
