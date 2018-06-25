module Codebreaker
  class Game
    ATTEMPTS = 10
    HINTS = 4

    attr_reader :used_attempts, :used_hints

    def initialize
      @secret_code = generate
      @shuffled_secret_code = @secret_code.shuffle
      @used_attempts = 0
      @used_hints = 0
    end

    def hint
      @used_hints += 1
      @shuffled_secret_code.pop
    end

    def make_guess(user_code)
      return unless code_valid?(user_code)
      @used_attempts += 1
      @user_code = user_code.chars.map(&:to_i)
      return '++++' if @user_code == @secret_code
      exact_matches + number_matches
    end

    private

    def generate
      Array.new(4) { rand(1..6) }
    end

    def code_valid?(user_code)
      user_code.match(/^[1-6]{4}$/)
    end

    def exact_matches
      @zipped_codes = @secret_code.zip(@user_code).delete_if { |el| el[0] == el[1] }
      '+' * (@secret_code.length - @zipped_codes.length)
    end

    def number_matches
      transposed = @zipped_codes.transpose
      secret_array = transposed[0]
      user_array = transposed[1]

      user_array.each do |el|
        if secret_array.include?(el)
          index = secret_array.index(el)
          secret_array.delete_at(index)
        end
      end
      '-' * (@zipped_codes.length - secret_array.length)
    end
  end
end
