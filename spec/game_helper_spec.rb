require "rails_helper"

RSpec.describe "GamesHelper", type: :helper do
  include ResultsHelper
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
  context "serialize_cards" do
    it "array over 1000 " do
      arg = { "card1" => "1310", "card2" => "1208", "card3" => "1306", "card4" => "1107", "card5" => "1204" }
      cards = serialize_cards(arg)
      expect(cards).to eq([1310, 1208, 1306, 1107, 1204])
    end
  end
  context "serialize_cards" do
    it "array under 1000" do
      arg = { "card1" => "310", "card2" => "208", "card3" => "306", "card4" => "107", "card5" => "204" }
      cards = serialize_cards(arg)
      expect(cards).to eq([310, 208, 306, 107, 204])
    end
  end
  context "change_cards" do
    it "array over 1000" do
      arg = { "card1" => "1310", "card2" => "1208", "card3" => "1306", "card4" => "1107", "card5" => "1204" }
      cards = serialize_cards(arg)
      changed_cards = change_cards(cards)
      expect(changed_cards.length).to eq(5)
    end
  end
  context "change_cards" do
    it "array under 1000" do
      arg = { "card1" => "310", "card2" => "208", "card3" => "306", "card4" => "107", "card5" => "204" }
      cards = serialize_cards(arg)
      changed_cards = change_cards(cards)
      expect(changed_cards).to eq([310, 208, 306, 107, 204])
    end
  end
  context "change_cards" do
    it "array under 1000 and over 1000" do
      arg = { "card1" => "1310", "card2" => "1208", "card3" => "306", "card4" => "107", "card5" => "204" }
      cards = serialize_cards(arg)
      changed_cards = change_cards(cards)
      expect(changed_cards).to include(306, 107, 204)
    end
  end
  context "form_cards" do
    it "array to hash" do
      arg = [310, 208, 306, 107, 204]
      cards = form_cards(arg)
      return_cards = { card1: 310, card2: 208, card3: 306, card4: 107, card5: 204 }
      expect(cards).to eq(return_cards)
    end
  end
end
