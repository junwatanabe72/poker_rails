class ResultsController < ApplicationController
  include ResultsHelper
  include GamesHelper

  def index
  end

  def show
    @result = Result.find(params[:id])
  end

  def create
    # カードを交換する

    # 手を判定する

    # 相手の手を作る
    @cards = create_initial_cards
    # 勝敗を決める

    attr = {
      victory: 1,
      card1: params[:card1],
      card2: params[:card2],
      card3: params[:card3],
      card4: params[:card4],
      card5: params[:card5],
    }
    @result = Result.create(attr)

    if @result.save
      # flash[:success] = 'ユーザを登録しました。'
      # redirect_to @result
    else
      # flash.now[:danger] = 'ユーザの登録に失敗しました。'
      # render :new
    end
  end
end
