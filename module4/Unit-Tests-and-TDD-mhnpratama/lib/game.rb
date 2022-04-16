require 'httparty'

# At this point in time, we only write the necessary code to make our spec pass
class Game
  def initialize(secret_word)
    @secret_word = secret_word
  end

  # Because we only handle all incorrect letters,
  # for now just immediately return "\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}"
  # which is the ASCII code for 🟦🟦🟦🟦🟦
  def match_word(guess_word)
    result = "\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}"

    # call the API
    # if not exists return "NOT"
    guess_word.downcase!
    @secret_word.downcase!
    
    url = "https://api.dictionaryapi.dev/api/v2/entries/en/#{guess_word}"
    is_english = HTTParty.get(url)

    if is_english.code != 200
      return puts("Not an English word")
    end

    guess_word.split('').each_with_index do |letter, index|
      # check if there is a character of secret_word exisrs
      # in guess_word
      if @secret_word[index] == letter
        result[index] = "\u{1F7E9}"
      elsif @secret_word.include?(letter)
        result[index] = "\u{1F7E8}"
      end
    end

    result
  end
end