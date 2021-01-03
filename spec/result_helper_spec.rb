require "rails_helper"

RSpec.describe "GamesHelper", type: :helper do
  include ResultsHelper
  include GamesHelper
  context "create_suits" do
    it "create 100~400" do
      arg = [310, 208, 306, 107, 204]
      numbers = create_suits(arg)
      expect(numbers).to eq([300, 200, 300, 100, 200])
    end
  end
  context "create_numbers" do
    it "create 1~13" do
      arg = [310, 208, 306, 107, 204]
      numbers = create_numbers(arg)
      expect(numbers).to eq([10, 8, 6, 7, 4])
    end
  end
  context "is_flush?" do
    it "true" do
      arg = [300, 300, 300, 300, 300]
      flush = is_flush?(arg)
      expect(flush).to be_truthy
    end
    it "false" do
      arg = [300, 200, 300, 100, 200]
      flush = is_flush?(arg)
      expect(flush).to be_falsey
    end
  end
  context "is_straight?" do
    it "true" do
      arg = [3, 2, 5, 4, 6]
      straight = is_straight?(arg)
      expect(straight).to be_truthy
    end
    it "true include 1" do
      arg = [1, 10, 11, 12, 13]
      straight = is_straight?(arg)
      expect(straight).to be_truthy
    end
    it "false" do
      arg = [3, 2, 5, 4, 8]
      straight = is_straight?(arg)
      expect(straight).to be_falsey
    end
  end
  context "is_pairs?" do
    it "four_card" do
      arg = [10, 8, 10, 10, 10]
      numbers = is_pairs?(arg)
      expect(numbers).to eq(7)
    end
    it "four_card" do
      arg = [10, 8, 10, 10, 10]
      numbers = is_pairs?(arg)
      expect(numbers).to eq(7)
    end
    it "full_house" do
      arg = [10, 8, 8, 10, 10]
      numbers = is_pairs?(arg)
      expect(numbers).to eq(6)
    end
    it "three_card" do
      arg = [10, 2, 1, 10, 10]
      numbers = is_pairs?(arg)
      expect(numbers).to eq(3)
    end
    it "one_pair" do
      arg = [10, 4, 1, 12, 4]
      numbers = is_pairs?(arg)
      expect(numbers).to eq(1)
    end
    it "hight_card" do
      arg = [10, 3, 1, 12, 4]
      numbers = is_pairs?(arg)
      expect(numbers).to eq(0)
    end
    it "two_pair" do
      arg = [3, 3, 12, 12, 4]
      numbers = is_pairs?(arg)
      expect(numbers).to eq(2)
    end
  end
  context "eval_hand" do
    it "create 9" do
      arg = [401, 410, 411, 412, 413]
      numbers = eval_hand(arg)
      expect(numbers).to eq(9)
    end
  end
  context "dual" do
    it "create 10" do
      numbers = dual(1, 1)
      expect(numbers).to eq(10)
    end
    it "create 0" do
      numbers = dual(1, 2)
      expect(numbers).to eq(0)
    end
    it "create number" do
      numbers = dual(3, 2)
      expect(numbers).to eq(3)
    end
  end
end
