class ResultsController < ApplicationController
  def index
    redirect_to root_path
  end

  def create
    @game = Game.start(game_params)
    formed_game_data = Result.form_game_data(@game)
    current_user.results.create(formed_game_data)
  end

  private

  def game_params
    params.require(:game).permit(user_hands: [:type, :id, :is_hold])
  end
end
