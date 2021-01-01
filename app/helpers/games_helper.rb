module GamesHelper
  def create_card
    card_codes = (1..4).map { |num| num * 100 }
    card_numbers = [*1..13]
    card = card_codes[rand(3)] + card_numbers[rand(12)]
    return card
  end

  def is_same_card?(cards, card)
    return cards.include?(card)
  end

  def create_initial_cards(initial_cards = [], card = 5)
    return_cards = []
    checked_cards = Marshal.load(Marshal.dump(initial_cards))
    card.times {
      created_card = create_card
      while is_same_card?(checked_cards, created_card)
        created_card = create_card
      end
      checked_cards << created_card
      return_cards << created_card
    }
    return return_cards
  end

  def delete_cards(cards, delete_numbers)
    return cards.select { |card| delete_numbers.include?(card) }
  end

  def exchange_number_to_path(card_number)
    mime = ".png"
    card_images = { diamond: 100, heart: 200, spade: 300, club: 400 }
    num = card_number % 100
    hundred = card_number - num
    image_codes = card_images.select { |key, value| value == hundred }.keys
    return image_path = "#{image_codes[0]}/#{num}#{mime}"
  end

  def form_card_number_to_image_path(cards)
    formed_cards = []
    formed_cards = cards.map { |card| exchange_number_to_path(card) }
    return formed_cards
  end

  def serialize_cards(result_params)
    return result_params.values.map(&:to_i)
  end

  def change_cards(cards)
    base_cards = cards.map { |card|
      next card - 1000 if card > 1000
      return card
    }
    return_cards = cards.map { |card|
      if card > 1000
        created_card = create_card()
        while is_same_card?(base_cards, created_card)
          created_card = create_card
        end
        next created_card
      end
      card
    }
    return return_cards
  end

  def form_cards(cards)
    formed_cards = {}
    cards.each_with_index { |card, num|
      formed_cards["card#{num + 1}".to_sym] = card
    }
    return formed_cards
  end
end
