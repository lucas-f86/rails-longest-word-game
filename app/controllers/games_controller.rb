class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
    @letters.shuffle!
    # raise
  end

  def score
    @word = params[:word]
    @letters = params[:letters].delete(' ').downcase
    @result = "sorry but TEST can't be built out of #{@letters}"
    raise
    # if @word != @letters
    #   @result
    # end
  end

  # def included?(w, l)
  #   w.join
  #   l.each do |x|
  #     x.belongs_to?(w)
  #   end
  # end
end
