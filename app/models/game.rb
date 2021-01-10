class Game
  include ActiveModel::Model
  attr_accessor :user_hands, :cpu_hands, :user_rank, :cpu_rank, :dealed_cards, :victory

  DRAW_TIMES = 5
  CARD_NUMBERS = [*1..13]
  CARD_CODES = ["club", "diamond", "heart", "spade"]
  WIN = 2
  LOSE = 1
  DROW = 0

  def self.create_hands(dealed_cards = [])
    cards = []
    DRAW_TIMES.times {
      card = Card.new(id: CARD_NUMBERS[rand(CARD_NUMBERS.length)], type: CARD_CODES[rand(CARD_CODES.length)], is_hold: false)
      while duplicate?(dealed_cards, card)
        card = Card.new(id: CARD_NUMBERS[rand(CARD_NUMBERS.length)], type: CARD_CODES[rand(CARD_CODES.length)], is_hold: false)
      end
      cards << card
      dealed_cards << card
    }
    return cards
  end

  def change_cards_of_not_is_hold
    return_cards = self.user_hands.map { |card|
      if !ActiveRecord::Type::Boolean.new.cast(card.is_hold)
        created_card = Card.new(id: CARD_NUMBERS[rand(CARD_NUMBERS.length)], type: CARD_CODES[rand(CARD_CODES.length)], is_hold: false)
        while Game.duplicate?(self.dealed_cards, created_card)
          created_card = Card.new(id: CARD_NUMBERS[rand(CARD_NUMBERS.length)], type: CARD_CODES[rand(CARD_CODES.length)], is_hold: false)
        end
        self.dealed_cards << created_card
        next created_card
      end
      card
    }
    return return_cards
  end

  def victory?(player, cpu)
    if player.rank == cpu.rank
      player_card_number = player.sub == 1 ? 14 : player.sub
      cpu_card_number = cpu.sub == 1 ? 14 : cpu.sub
      if player_card_number > cpu_card_number
        return WIN
      else
        return LOSE
      end
      return DROW
    end
    if player.rank > cpu.rank
      return WIN
    end
    return LOSE
  end

  def self.start(game_params)
    changed_params = change_data_to_instance_from_json(game_params)
    @game = Game.new(user_hands: changed_params)
    @game.dealed_cards = @game.user_hands.map { |card| card }
    @game.user_hands = @game.change_cards_of_not_is_hold
    @game.cpu_hands = Game.create_hands(@game.dealed_cards)
    judged_data_of_player = Judge.start(@game.user_hands)
    judged_data_of_cpu = Judge.start(@game.cpu_hands)
    @game.user_rank = judged_data_of_player.rank
    @game.cpu_rank = judged_data_of_cpu.rank
    @game.victory = @game.victory?(judged_data_of_player, judged_data_of_cpu)
    @game
  end

  private

  def self.duplicate?(cards, created_card)
    if cards.empty?
      return false
    end
    checked_cards = cards.select { |card|
      card.id.to_i == created_card.id.to_i &&
      card.type.to_sym == created_card.type.to_sym
    }
    return checked_cards.length > 0
  end

  def self.change_data_to_instance_from_json(game_params)
    cards = []
    cards = game_params.to_h["user_hands"].map { |card|
      Card.new(id: card[:id], type: card[:type], is_hold: card[:is_hold])
    }
  end
end
