require "rails_helper"

RSpec.describe Judge, type: :model do
  CARD_NUMBERS = [*1..13]
  CARD_CODES = ["club", "diamond", "heart", "spade"]
  RANK = { high: 0,
           one: 1,
           two: 2,
           three: 3,
           straight: 4,
           flush: 5,
           full: 6,
           four: 7,
           sflush: 8,
           royal: 9 }
  let(:judge) { Judge.new(hands) }
  let(:hands) { array.map { |num| Card.new(id: num, type: CARD_CODES[rand(CARD_CODES.length)], is_hold: false) } }
  let(:array) { (1..5) }
  describe "eval_hand" do
    subject { judge.eval_hand }
    context "when straight" do
      let(:array) { [2, 3, 4, 5, 6] }
      it {
        is_expected.to eq(RANK[:straight])
        expect(judge.sub).to eq(6)
      }
    end
    describe "same suits" do
      let(:hands) { array.map { |num| Card.new(id: num, type: "spade", is_hold: false) } }
      context "when royal_straight" do
        let(:array) { [1, 10, 11, 12, 13] }
        it {
          is_expected.to eq(RANK[:royal])
          expect(judge.sub).to eq(13)
        }
      end
      context "when royal_straight" do
        let(:array) { [11, 10, 13, 12, 9] }
        it {
          is_expected.to eq(RANK[:sflush])
          expect(judge.sub).to eq(13)
        }
      end
      context "when flush" do
        let(:array) { [11, 5, 7, 12, 9] }
        it {
          is_expected.to eq(RANK[:flush])
          expect(judge.sub).to eq(12)
        }
      end
    end
    describe "start" do
      subject { Judge.start(hands) }
      context "return straight" do
        it {
          is_expected.to have_attributes(rank: 4)
          is_expected.to have_attributes(sub: 5)
        }
      end
      context "return four card" do
        let(:array) { [1, 1, 7, 1, 1] }
        it {
          is_expected.to have_attributes(rank: RANK[:four])
          is_expected.to have_attributes(sub: 14)
        }
      end
      context "return two pair" do
        let(:array) { [1, 2, 13, 13, 1] }
        it {
          is_expected.to have_attributes(rank: RANK[:two])
          is_expected.to have_attributes(sub: 54)
        }
      end
    end
  end
  # under private
  # describe "get_numbers" do
  #   it "exchange elements of array to card.id from card instance" do
  #     result = judge.get_numbers(hands).each.all? { |hand| CARD_NUMBERS.include?(hand) }
  #     expect(result).to be_truthy
  #   end
  # end
  # describe "get_suits" do
  #   it "exchange elements of array to card.type from card instance" do
  #     result = judge.get_suits(hands).each.all? { |hand| CARD_CODES.include?(hand) }
  #     expect(result).to be_truthy
  #   end
  # end
  # describe "is_flush?" do
  #   let(:suits) { judge.get_suits(hands) }
  #   subject { judge.is_flush?(suits) }
  #   context "when is flush" do
  #     let(:suits) { Array.new(5, "diamond") }
  #     it { is_expected.to be_truthy }
  #   end
  #   context "when not flush" do
  #     it { is_expected.to be_falsey }
  #   end
  # end
  # describe "is_straight?" do
  #   let(:numbers) { judge.get_numbers(hands) }
  #   subject { judge.is_straight?(numbers) }
  #   context "when straight" do
  #     it { is_expected.to be_truthy }
  #   end
  #   context "when straight with not sort number" do
  #     let(:array) { [8, 9, 11, 10, 12] }
  #     it { is_expected.to be_truthy }
  #   end
  #   context "when straight with [1, 10, 11, 12, 13]" do
  #     let(:array) { [1, 10, 11, 12, 13] }
  #     it { is_expected.to be_truthy }
  #   end
  #   context "when not straight" do
  #     let(:array) { [1, 2, 3, 4, 6] }
  #     it { is_expected.to be_falsey }
  #   end
  # end
  # describe "is_royal_straight?" do
  #   let(:numbers) { judge.get_numbers(hands) }
  #   subject { judge.is_royal_straight?(numbers) }
  #   context "when royal_straight" do
  #     let(:array) { [1, 10, 11, 12, 13] }
  #     it { is_expected.to be_truthy }
  #   end
  #   context "when not royal_straight" do
  #     it { is_expected.to be_falsey }
  #   end
  # end
  # describe "is_pairs?" do

  #   let(:numbers) { judge.get_numbers(hands) }
  #   subject { judge.is_pairs?(numbers) }
  #   context "when match pairs" do
  #     context "when four card" do
  #       let(:array) { [1, 1, 1, 1, 13] }
  #       it {
  #         is_expected.to eq(RANK[:four])
  #         expect(judge.sub).to eq(14)
  #       }
  #     end
  #     context "when full house" do
  #       let(:array) { [1, 13, 1, 1, 13] }
  #       it {
  #         is_expected.to eq(RANK[:full])
  #         expect(judge.sub).to eq(27)
  #       }
  #     end
  #     context "when three card" do
  #       let(:array) { [1, 5, 1, 1, 13] }
  #       it {
  #         is_expected.to eq(RANK[:three])
  #         expect(judge.sub).to eq(14)
  #       }
  #     end
  #     context "when two pair" do
  #       let(:array) { [2, 2, 1, 1, 13] }
  #       it {
  #         is_expected.to eq(RANK[:two])
  #         expect(judge.sub).to eq(32)
  #       }
  #     end
  #     context "when one pair" do
  #       let(:array) { [2, 9, 1, 1, 13] }
  #       it {
  #         is_expected.to eq(RANK[:one])
  #         expect(judge.sub).to eq(14)
  #       }
  #     end
  #   end
  #   context "when no match pairs" do
  #     let(:array) { [2, 9, 7, 1, 13] }
  #     it {
  #       is_expected.to eq(RANK[:high])
  #       expect(judge.sub).to eq(14)
  #     }
  #   end
  # end
end
