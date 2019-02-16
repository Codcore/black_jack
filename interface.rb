require_relative 'interface_messages'

class Interface
  include InterfaceMessages

  def show_msg(msg, start_limiter = true, end_limiter = true)
    show_start_limiter if start_limiter
    str_length = 62
    to_fill    = str_length - msg.length
    fill_start = to_fill / 2
    fill_end   = to_fill - fill_start
    fill_start_str, fill_end_str = '', ''
    fill_start.times { fill_start_str += ' ' }
    fill_end.times   { fill_end_str   += ' ' }
    fill_start_str = "║#{fill_start_str}"
    fill_end_str   = "#{fill_end_str}║"
    str = fill_start_str + msg + fill_end_str
    puts str
    show_end_limiter if end_limiter
  end

  def show_prompt(msg)
    puts "⟹   #{msg}:"
  end

  def show_start_limiter
    puts LIMITER_START
  end

  def show_middle_limiter
    puts LIMITER_MIDDLE
  end

  def show_end_limiter
    puts LIMITER_END
  end

  def user_choice(max)
    choice = gets.to_i
    return unless (1..max).cover?(choice)

    choice
  end

  def user_input
    gets.chomp.to_s
  end

  def show_menu(array)
    show_msg(construct_menu(array))
  end

  def show_hand(player)
    show_msg("#{player.name} cards:", false, false)
    show_msg("#{player.hand}", false, false)
  end

  def show_points(player)
    return show_msg('', false, false) unless player.show_points

    show_msg("#{player.name} points: #{player.show_points}", false, false)
  end

  def show_bank(player)
    show_msg("#{player.name} bank: #{player.bank} $", false, false)
  end

  def show_game_screen(*players)
    show_start_limiter
    players.each do |player|
      show_hand(player)
      show_points(player)
      show_bank(player)
      player == players.last ? show_end_limiter : show_middle_limiter
    end
  end

  def show_actions
    show_menu(ACTIONS_MENU)
  end

  private

  def construct_menu(array)
    menu_str = ''
    array.each.with_index(1) do |item, index|
      menu_str << "[(#{index}) - #{item}]  "
    end
    menu_str
  end
end