require "rails_helper"

RSpec.describe Card, type: :model do
  describe "create card with new method" do
    CARD_NUMBERS = [*1..13]
    CARD_CODES = ["club", "diamond", "heart", "spade"]

    let(:card) { Card.new(id: id, type: type, is_hold: is_hold) }
    subject { card.is_hold }

    context "when arg is random" do
      let(:id) { CARD_NUMBERS[rand(CARD_NUMBERS.length)] }
      let(:type) { CARD_CODES[rand(CARD_CODES.length)] }
      let(:is_hold) { false }
      it { is_expected.to be_falsey }

      it "is id as CARD_NUMBERS" do
        expect(CARD_NUMBERS).to include(card.id)
      end
      it "is type as CARD_CODES" do
        expect(CARD_CODES).to include(card.type)
      end
    end
    context "when arg is sequenlial" do
      let(:id) { 1 }
      let(:type) { "diamond" }
      let(:is_hold) { true }
      it { is_expected.to be_truthy }
      it "is id as 1" do
        expect(card.id).to eq(1)
      end
      it "is id as diamond" do
        expect(card.type).to eq("diamond")
      end
    end
  end
end
