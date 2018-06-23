require_relative 'game'

module UiHelper
  def greeting_message
    puts '***Welcome to the Codebreaker game!***'
    puts "Enter any characters to start playing or 'exit' for exit"
  end

  def start_game_message
    puts "Please, enter your code to make guess or 'h' to get a hint"
    puts "You have #{Codebreaker::Game::ATTEMPTS} attempts and #{Codebreaker::Game::HINTS} hints"
  end

  def used_attempts_message
    puts "You used #{@game.used_attempts} attempts." if @game.used_attempts > 0
  end

  def no_hints_message
    puts 'You used all of hints!'
  end

  def incorrect_format_message
    puts 'Incoorect format! Please enter 4 digits from 1 to 6'
  end

  def won_message
    puts '***Congratulations, you won!***'
  end

  def lost_message
    puts 'You used all of attempts. You lost :('
  end

  def after_game_message
    puts 'Do you want to play again(y/n) or save score(s)?'
  end

  def saved_result_message
    puts 'Your result has been saved'
  end
end
