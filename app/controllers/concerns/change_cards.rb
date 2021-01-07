module ChangeCards
  extend ActiveSupport::Concern
  include CreateCards

  def serialize_cards(result_params)
    return result_params.values.map(&:to_i)
  end

  def change_cards(cards)
    base_cards = cards.map { |card|
      next card - 1000 if card > 1000
      card
    }
    return_cards = cards.map { |card|
      if card > 1000
        created_card = create_card()
        while is_same_card?(base_cards, created_card)
          created_card = create_card
        end
        base_cards << created_card
        next created_card
      end
      card
    }
    return return_cards
  end

  def create_conclusive_cards(result_params)
    serialized_cards = serialize_cards(result_params)
    # # チェンジを選んだカード交換する
    changed_cards = change_cards(serialized_cards)
    return changed_cards
  end

  def form_cards(cards, result_number)
    formed_cards = {}
    cards.each_with_index { |card, num|
      formed_cards["card#{num + 1}".to_sym] = card
    }
    formed_cards[:victory] = result_number
    return formed_cards
  end
end
