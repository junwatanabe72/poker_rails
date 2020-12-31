class ToppagesController < ApplicationController
  include GamesHelper

  def index
    @result = Result.new()
    @cards = create_initial_cards
  end
end
