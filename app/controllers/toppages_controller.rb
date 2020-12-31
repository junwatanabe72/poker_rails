class ToppagesController < ApplicationController
  include GamesHelper

  def index
    @cards = create_initial_cards
  end
end
