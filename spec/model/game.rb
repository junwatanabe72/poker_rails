require "rails_helper"

RSpec.describe Game, type: :model do
  CARD_NUMBERS = [*1..13]
  CARD_CODES = ["club", "diamond", "heart", "spade"]
  describe "cheack Game" do
    describe "create_hands" do
      let(:game) { Game.create_hands() }
      context "is_vaild_length" do
        it "returns no error" do
          expect(game.length).to eq(5)
        end
      end
      context "is_duplicate?" do
        it "returns no error" do
          # [[1,"dimond"],[2,"spade"]]
          suit_number = { diamond: 100, spade: 200, heart: 300, club: 400 }
          hands = game.map { |card| suit_number[card.type.to_sym] + card.id }.uniq
          expect(hands.length).to eq(5)
        end
      end
    end
    describe "start" do
      let(:game) { Game.start(Game.create_hands()) }
      context "is_vaild_length" do
        it "returns no error" do
          expect(game.cpu_rank).to eq(true)
          expect(game.cpu_hands).to eq(5)
        end
      end
    end
    # context "range_in_CARD_CODES" do
    #   it "returns no error" do
    #     cards_types = game.select { |card| CARD_CODES.include?(card.type) }
    #     expect(cards_types.length).to eq(5)
    #   end
    # end
    # context "range_in_CARD_NUMBERS" do
    #   it "returns no error" do
    #     cards_ids = game.select { |card| CARD_NUMBERS.include?(card.id) }
    #     expect(cards_ids.length).to eq(5)
    #   end
    # end
    # context "all_cards_has_false_of_is_hold" do
    #   it "returns no error" do
    #     cards_is_holds = game.select { |card| card.is_hold == false }
    #     expect(cards_is_holds.length).to eq(5)
    #   end
    # end
    # describe "change_card_of_ishold_attr_with_false" do
    #   let(:game) { Game.new(user_hands: Game.create_hands) }
    #   context "is_vaild_length" do
    #     it "returns no error" do
    #       expect(game.change_card_of_ishold_attr_with_false.length).to eq(5)
    #     end
    #   end
    # end
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
