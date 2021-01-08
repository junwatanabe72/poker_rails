require "rails_helper"

RSpec.describe Card, type: :model do
  describe "cheack Card attr" do
    CARD_NUMBERS = [*1..13]
    CARD_CODES = ["club", "diamond", "heart", "spade"]
    let(:card) { Card.new() }

    context "is_hold" do
      it "returns no error" do
        expect(card.is_hold).to be_falsey
      end
    end
    context "id" do
      it "returns no error" do
        expect(CARD_NUMBERS).to include(card.id)
      end
    end
    context "type" do
      it "returns no error" do
        expect(CARD_CODES).to include(card.type)
      end
    end
  end
end
