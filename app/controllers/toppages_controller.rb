class ToppagesController < ApplicationController
  include GamesHelper

  def index
    if logged_in?
      @result = Result.new()
      @cards = create_initial_cards
    end
  end
end
