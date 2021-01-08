class Card
  include ActiveModel::Model
  attr_accessor :id, :type, :is_hold

  CARD_NUMBERS = [*1..13]
  CARD_CODES = ["club", "diamond", "heart", "spade"]

  def initialize()
    @id = CARD_NUMBERS[rand(CARD_NUMBERS.length)]
    @type = CARD_CODES[rand(CARD_CODES.length)]
    @is_hold = false
  end
end
