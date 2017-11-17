# Word Bulls & Cows
# Players: Two - Also known as: Word Mastermind
# Players take turns in trying to guess each other's word.
# Description
# One player, the Chooser, thinks of a four-letter word and the other player, the Guesser, tries to guess it.
# At each turn the Guesser tries a four-letter word, and the Chooser says how close it is to the answer by giving:
# The number of Bulls - letters correct in the right position.The number of Cows - letters correct but in the wrong position.
# The Guesser tries to guess the answer in the fewest number of turns.
# The word to be guessed should not have repeating letters. Example, BOOK, TILT, KICK, BASS etc. are not allowed.
# Example
# For example, if the Chooser has thought of the word LOVE the replies for some guesses are as follows:
# Essentially, your program is the "Guesser" in the description of the game above. Your algorithm guesses the word, while the Chooser (human) gives the cows and bulls score for each guess using command line.

load 'lib/game.rb'

class Play
  def start
    str = "Please select your choice!\n" \
    "1 - Let's play\n"\
    "0 - Quit\n"
    want_to_play = 1
    while(want_to_play==1)
      puts str
      want_to_play = gets.chomp.to_i
      case want_to_play
      when 1
        word = guess_word
        cows, bulls = verify_word(word)
        if bulls == word.length
          puts "You win!"
          want_to_play = 0
        else
          puts "Total #{cows} cows and #{bulls} bulls."
        end
      when 0
        puts "Oops! Bye."
      end
    end
  end

  # validate duplicate characters
  def non_uniq word
    word.scan(/[a-z]/i).uniq.length != word.length
  end

  def guess_word
    puts "Guess your word - "
    word = gets.chomp.downcase
    if non_uniq(word)
      puts "Wrong guess! Please try again!"
      guess_word
    end
    word
  end

  def verify_word word
    game = Game.new
    game.check(word)
  end
end

p = Play.new
p.start