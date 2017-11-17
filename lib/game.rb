require 'csv'
load 'lib/dictionary.rb'
require 'pry'

class Game
  def check word
    return [check_cows(word), check_bulls(word)]
  end

  # check bulls
  def check_bulls word
    dictionary = Dictionary.new
    total_bulls = 0
    combination_words = bull_match_words(word)
    dictionary.list.each do |dictionary_word|
      matched_bulls = []
      if dictionary_word.downcase == word
        total_bulls = word.length
        break
      end
      combination_words.each do |bull_word|
        matched_bulls.push(bull_word) if dictionary_word.downcase.include?(bull_word)
      end
      matched_bulls_length = matched_bulls.max_by(&:length).length rescue 0
      total_bulls = matched_bulls_length if matched_bulls_length > total_bulls
    end
    total_bulls
  end

  # check cows
  def check_cows word
    dictionary = Dictionary.new
    total_cows = 0
    combination_words = word.chars
    dictionary.list.each do |dictionary_word|
      matched_cows = []
      if dictionary_word.downcase == word
        total_cows = word.length
        break
      end
      combination_words.each do |cow_word|
        matched_cows.push(cow_word) if dictionary_word.downcase.include?(cow_word)
      end
      total_cows = matched_cows.length if matched_cows.length > total_cows
    end
    total_cows
  end

  # ["lock", "loc", "ock", "lo", "oc", "ck", "k", "c", "o", "l"]
  def bull_match_words(word)
    spell = []
    (0..word.length-1).each do |i|
      (i..word.length-1).each do |j|
        spell.push(word[i..j])
      end
    end
    spell.sort_by(&:length).reverse - word.chars - [word]
  end
end