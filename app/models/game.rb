class Game
  include ActiveModel::Model
  attr_accessor :cards

  CARD_NUMBER = 5

  def self.start
    cards = []
    CARD_NUMBER.times {
      card = Card.new()
      while duplicate?(cards, card)
        card = Card.new()
      end
      cards << card
    }
    return cards
  end

  private

  def self.duplicate?(cards, created_card)
    if cards.empty?
      false
    end
    checked_cards = cards.select { |card|
      card.id != created_card.id &&
      card.type != created_card.type
    }
    checked_cards.length == cards
  end
end
