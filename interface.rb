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

  def user_choice
    gets.to_i
  end

  def user_input
    gets.chomp.to_s
  end

  def show_menu(array)
    show_msg(construct_menu(array))
  end

  def show_hands(player_name, player_cards, dealer_cards)
    show_msg('Dealer cards:', true, false)
    show_msg(dealer_cards, false, false)
    show_middle_limiter
    show_msg("#{player_name}, Your cards:", false, false)
    show_msg(player_cards, false, true)
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