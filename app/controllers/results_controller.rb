class ResultsController < ApplicationController
  before_action :require_user_logged_in, only: [:create]

  def create
    # byebug
    # カードの値をobjectからarrayに成生する
    cards = serialize_cards(result_params)

    # チェンジを選んだカード交換する
    cards = change_cards(cards)
    # byebug
    # プレイヤーの手を判定する
    self_result = eval_hand(cards)

    # 相手の手を作る
    @cards = create_initial_cards(cards)

    # 手を判定する
    @other_result = eval_hand(@cards)

    # 勝敗を決める
    final_result = dual(self_result, @other_result)

    # dbに保存するために、arrayからobjectへカードを戻す
    cards = form_cards(cards)
    # viewに渡すための手(interger)

    cards[:victory] = final_result

    @result = Result.create(cards)
  end

  private

  def result_params
    params.require(:result).permit(:card1, :card2, :card3, :card4, :card5)
  end
end
