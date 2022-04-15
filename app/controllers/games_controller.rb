require 'open-uri'
require ''

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ("A".."Z").to_a.sample
    end
  end

  def word_english
    url = "https//wagon-dicionary.herokuapp.com/#{@answer}"
    word_dicionary = open(url).read
    word = json.parse(word_dicionary)
    return ['found']
  end

  def grid_letter
    @answer.chart.sort.all? { |letter| @grid.include?(letter)}
  end


  def score
    @answer = params[:word]
    @grid = params[:grid]
    grid_letter = @grid.each_char { |letter| print letter, '' }

      if !grid_letter
        @result = "sorry, but #{@answer.upcase} can't be built out of #{grid_letter}"
      elsif !word_english
        @result = "sorry, but #{} does not seem to be in english"
      elsif letter_in_grid && !english_word
        @result = "Sorry but #{@answer.upcase} does not seem to be an English word."
      else letter_in_grid && !english_word
        @result = "Congratulation! #{@answer.upcase} is a valid English word."
      end
  end
end
@grid.each_char { |letter| print letter, ''}

