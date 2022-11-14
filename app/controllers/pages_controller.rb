require 'open-uri'
require 'json'

class PagesController < ApplicationController
  def home
  end

  def game
    @grid = []
    10.times do
      @grid << ('a'..'z').to_a.sample
    end
  end

  def in_grid?(answer, grid)
    in_grid = false
    answer.each_char do |element|
      if grid.include?(element)
        grid.delete(element)
        in_grid = true
      else
        in_grid = false
        break
      end
    end
  end

  def answer
    @answer = params[:answer]
    @generated_grid = params[:grid]

    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)

    if user["found"] && in_grid?(@answer, @generated_grid)
      @result = "CONGRATULATIONS! #{@answer.upcase} is a valid English word!"
    else
      @result = "API: #{@answer} IS NOT FOUND OR WORD IN NOT IN GRID"
    end
  end
end
