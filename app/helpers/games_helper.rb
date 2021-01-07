module GamesHelper
  def exchange_number_to_path(card_number)
    mime = ".png"
    card_images = { diamond: 100, heart: 200, spade: 300, club: 400 }
    num = card_number % 100
    hundred = card_number - num
    image_codes = card_images.select { |key, value| value == hundred }.keys
    return image_path = "#{image_codes[0]}/#{num}#{mime}"
  end

  def get_cards_number(result)
    cards = []
    (1..5).each { |num|
      cards << result[("card#{num}").to_sym]
    }
    return cards
  end
end
