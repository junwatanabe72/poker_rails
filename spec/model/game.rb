require "rails_helper"
require "rspec/its"
require "json"

RSpec.describe Game, type: :model do
  CARD_NUMBERS = [*1..13]
  CARD_CODES = ["club", "diamond", "heart", "spade"]
  let(:hands) { Game.create_hands() }

  describe "#is_duplicate?" do
    let(:cards) { [Card.new(id: CARD_NUMBERS[0], type: CARD_CODES[0], is_hold: false)] }
    let(:card) { Card.new(id: CARD_NUMBERS[0], type: CARD_CODES[0], is_hold: false) }
    subject { Game.duplicate?(cards, card) }
    context "when duplicate" do
      it {
        is_expected.to be_truthy
      }
    end
    context "when is cards empty" do
      let(:cards) { [] }
      it {
        is_expected.to be_falsey
      }
    end
    context "when not duplicate" do
      let(:card) { Card.new(id: CARD_NUMBERS[1], type: CARD_CODES[0], is_hold: false) }
      it {
        is_expected.to be_falsey
      }
    end
  end
  describe "#create_hands" do
    let(:cards) { (1..5).map { |num| Card.new(id: num, type: CARD_CODES[rand(CARD_CODES.length)], is_hold: true) } }
    subject { Game.create_hands(cards) }
    context "when not arg" do
      let(:cards) { [] }
      its(:size) { is_expected.to eq 5 }
    end
    context "when arg" do
      its(:size) { is_expected.to eq 5 }
    end
  end
  describe "#judge" do
    let(:game) { Game.new(user_hands: params) }
    let(:params) { array.map { |num| Card.new(id: num, type: CARD_CODES[0], is_hold: true) } }
    subject { game.judge }
    context "when win on" do
      let(:array) { [1, 10, 11, 12, 13] }
      it {
        is_expected.to have_attributes(victory: 2)
        is_expected.to have_attributes(user_rank: 9)
      }
    end
    context "when lose on" do
      let(:params) { array.map { |num| Card.new(id: num, type: CARD_CODES[rand(CARD_CODES.length)], is_hold: true) } }
      let(:array) { [5, 2, 3, 4, 7] }
      it {
        is_expected.to have_attributes(victory: 1)
        is_expected.to have_attributes(user_rank: 0)
      }
    end
  end
  describe "#change_params_to_instance" do
    let(:params) {
      { "user_hands" => [{ is_hold: "false", type: "spade", id: "8" },
                        { is_hold: "false", type: "spade", id: "8" },
                        { is_hold: "false", type: "spade", id: "8" },
                        { is_hold: "false", type: "spade", id: "8" },
                        { is_hold: "false", type: "spade", id: "8" }] }
    }
    subject { Game.change_params_to_instance(params) }
    its(:size) { is_expected.to eq 5 }
  end
  describe "#start" do
    let(:params) {
      { "user_hands" => [{ is_hold: "true", type: "spade", id: "10" },
                        { is_hold: "true", type: "spade", id: "12" },
                        { is_hold: "true", type: "spade", id: "1" },
                        { is_hold: "true", type: "spade", id: "13" },
                        { is_hold: "true", type: "spade", id: "11" }] }
    }
    subject { Game.start(params) }
    context "when win on" do
      it {
        is_expected.to have_attributes(victory: 2)
        is_expected.to have_attributes(user_rank: 9)
      }
    end
    context "when lose on" do
      let(:params) {
        { "user_hands" => [{ is_hold: "true", type: "diamond", id: "3" },
                          { is_hold: "true", type: "spade", id: "4" },
                          { is_hold: "true", type: "spade", id: "5" },
                          { is_hold: "true", type: "spade", id: "8" },
                          { is_hold: "true", type: "spade", id: "2" }] }
      }
      it {
        is_expected.to have_attributes(victory: 1)
        is_expected.to have_attributes(user_rank: 0)
      }
    end
  end
end
