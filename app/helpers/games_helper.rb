module GamesHelper
  def create_cards
    mime = ".png"
    card_numbers = [*1..13]
    card_images = ["diamond", "heart", "spade", "club"]
    card = "#{card_images[rand(3)]}/#{card_numbers[rand(12)].to_s}#{mime}"
    return card
  end

  def is_same_card?(cards, card)
    return cards.include?(card)
  end

  def create_initial_cards
    initial_cards = []
    5.times {
      card = create_cards
      while is_same_card?(initial_cards, card)
        card = create_cards
      end
      initial_cards << card
    }
    return initial_cards
  end
end
