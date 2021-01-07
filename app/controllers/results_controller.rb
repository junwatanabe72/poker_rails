class ResultsController < ApplicationController
  def index
    redirect_to root_path
  end

  def create
    # カードを交換して最終的な手を作る
    conclusive_cards = create_conclusive_cards(result_params)
    # 相手の手を作る
    @opponent_cards = create_initial_cards(conclusive_cards)
    @opponent_result = eval_hand(@opponent_cards)
    # 手を比較し、勝敗に応じてnumberを返す。
    result_number = play_poker(conclusive_cards, @opponent_cards)
    # # dbに保存するために、arrayからobjectへカードを戻す
    formed_conclusive_cards = form_cards(conclusive_cards, result_number)

    @result = current_user.results.create(formed_conclusive_cards)
  end

  private

  def result_params
    params.require(:result).permit(:card1, :card2, :card3, :card4, :card5)
  end
end
