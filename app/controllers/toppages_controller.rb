class ToppagesController < ApplicationController
  skip_before_action :require_user_logged_in
  include GamesHelper

  def index
    if logged_in?
      @result = Result.new()
      @cards = create_initial_cards
    end
  end
end
