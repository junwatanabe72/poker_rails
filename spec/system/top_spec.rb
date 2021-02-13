require "rails_helper"

RSpec.describe "/", type: :system do
  before do
    visit root_path
  end
  describe "not login" do
    it "has explain text" do
      expect(page).to have_content("A simple poker game")
    end
  end
  describe "login" do
    let(:user_a) { FactoryBot.create(:user) }
    before do
      visit login_path
      fill_in "session_email", with: login_user.email
      fill_in "session_password", with: login_user.password
      click_button "session_button"
      visit root_path
    end
    describe "/" do
      let(:login_user) { user_a }
      context "check view" do
        it "has game view" do
          images_all = all("img")
          expect(images_all.length).to eq(5)
        end
        it "has explain text" do
          expect(page).to have_content("Press the Play button")
        end
      end
      context "click play" do
        before do
          click_button "play-poker"
        end
        it "go to result_path" do
          expect(page).to have_current_path results_path
        end
        it "show judge of play" do
          expect(["you win!", "draw", "lose"]).to include(find("#result").text)
        end
      end
      context "operate cards" do
        cards = []
        before do
          image_all = all(".toppage-cards")
          (0..4).each { |n|
            cards << image_all[n][:src]
          }
          click_button "play-poker"
        end
        it "exchange the card" do
          image_all = all(".result-cards")
          (0..4).each { |n|
            expect(image_all[n][:src]).not_to eq(cards[n])
          }
        end
      end
      context "work js", js: true do
        card = ""
        before do
          image_all = all(".toppage-cards")
          card = image_all[0][:src]
          find("#card-1").click
          click_button "play-poker"
        end
        it "hold card of 1" do
          image_all = all(".result-cards")
          expect(image_all[0][:src]).to eq(card)
        end
      end
    end
  end
end
