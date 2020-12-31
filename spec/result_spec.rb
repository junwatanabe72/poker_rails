require "rails_helper"

RSpec.describe "GamesHelper", type: :helper do
  include ResultsHelper
  include GamesHelper
  # context "separate_suit_and_number" do
  #   it "is eval" do
  #     cards = create_initial_cards
  #     expect(separate_suit_and_number(cards)).to be <= 10
  #   end
  # end
  context "eval_hand" do
    it "is eval" do
      cards = create_initial_cards
      expect(eval_hand(cards)).to be <= 10
    end
  end
end
