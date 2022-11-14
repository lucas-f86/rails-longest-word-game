require "open-uri"

class GamesController < ApplicationController
  VOWELS = %w(A E I O U Y)

  def new
    @letters = Array.new(5) { VOWELS.sample }
    @letters += Array.new(5) { (('A'..'Z').to_a - VOWELS).sample }
    @letters.shuffle!
  end

  def score
    @letters = params[:letters].split
    @word = (params[:word] || "").upcase
    @included = included?(@word, @letters)
    @english_word = english_word?(@word)
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end

# class GamesController < ApplicationController
#   def new
#     @letters = ('A'..'Z').to_a.sample(10)
#     @letters.shuffle!
#     # raise
#   end

#   def score
#     @word = params[:word]
#     @letters = params[:letters].delete(' ').downcase
#     @result = "sorry but TEST can't be built out of #{@letters}"
#     raise
#     # if @word != @letters
#     #   @result
#     # end
#   end

#   # def included?(w, l)
#   #   w.join
#   #   l.each do |x|
#   #     x.belongs_to?(w)
#   #   end
#   # end
# end
