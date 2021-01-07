module CreateCards
  extend ActiveSupport::Concern

  def create_card
    card_codes = (1..4).map { |num| num * 100 }
    card_numbers = [*1..13]
    card = card_codes[rand(3)] + card_numbers[rand(12)]
    return card
  end

  def is_same_card?(cards, card)
    return cards.include?(card)
  end

  def create_initial_cards(initial_cards = [], number_of_cards = 5)
    return_cards = []
    checked_cards = initial_cards.map { |card| card }
    number_of_cards.times {
      created_card = create_card
      while is_same_card?(checked_cards, created_card)
        created_card = create_card
      end
      checked_cards << created_card
      return_cards << created_card
    }
    return return_cards
  end
end
