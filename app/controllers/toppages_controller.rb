class ToppagesController < ApplicationController
  skip_before_action :require_user_logged_in

  def index
    if logged_in?
      @game = Game.new()
      @player_cards = Game.create_hands()
    end
  end
end
