require "rails_helper"

RSpec.describe "GamesHelper", type: :helper do
  include GamesHelper
  context "create_card" do
    it "is 101~413" do
      card_codes = (1..4).map { |num| num * 100 }
      card_numbers = [*1..13]
      expected_numbers = card_codes.map { |num| card_numbers.map { |n| num + n } }.flatten
      card = create_card()
      (1..100).each {
        expect(expected_numbers).to include card
      }
    end
  end
  context "create_initial_cards" do
    it "is no5" do
      (1..100).each {
        cards = create_initial_cards()
        expect(cards.uniq.length).to eq(5)
      }
    end
  end
  context "exchange_number_to_path" do
    it "is path" do
      path = exchange_number_to_path(413)
      expect(path).to eq("club/13.png")
    end
  end
end
