require "rails_helper"

RSpec.describe Game, type: :model do
  describe "cheack Game attr" do
    CARD_NUMBERS = [*1..13]
    CARD_CODES = ["club", "diamond", "heart", "spade"]
    let(:game) { Game.start() }

    context "is_vaild_length" do
      it "returns no error" do
        expect(game.length).to eq(5)
      end
    end
    context "range_in_CARD_CODES" do
      it "returns no error" do
        cards_types = game.select { |card| CARD_CODES.include?(card.type) }
        expect(cards_types.length).to eq(5)
      end
    end
    context "range_in_CARD_NUMBERS" do
      it "returns no error" do
        cards_ids = game.select { |card| CARD_NUMBERS.include?(card.id) }
        expect(cards_ids.length).to eq(5)
      end
    end
    context "all_cards_has_false_of_is_hold" do
      it "returns no error" do
        cards_is_holds = game.select { |card| card.is_hold == false }
        expect(cards_is_holds.length).to eq(5)
      end
    end
    # context "id" do
    #   it "returns no error" do
    #     expect(CARD_NUMBERS).to include(card.id)
    #   end
    # end
    # context "type" do
    #   it "returns no error" do
    #     expect(CARD_CODES).to include(card.type)
    #   end
    # end
  end
end
