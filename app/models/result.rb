class Result < ApplicationRecord
  has_many :user_results
  has_many :users, through: :user_results

  def self.form_game_data(game)
    formed_game_data = {}
    victory = game.victory
    rank = game.user_rank
    hands = game.user_hands
    hands.each_with_index { |card, num|
      formed_game_data["card#{num + 1}".to_sym] = "#{card.type}/#{card.id}.png"
    }
    formed_game_data[:rank] = rank
    formed_game_data[:victory] = victory
    return formed_game_data
  end
end
