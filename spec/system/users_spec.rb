require "rails_helper"

RSpec.describe "/users", type: :system do
  describe "not login" do
    describe "#show" do
      it "is redirect to login_path" do
        visit user_path(1)
        expect(page).to have_current_path login_path
      end
    end
    describe "#index" do
      it "is redirect to login_path" do
        visit users_path
        expect(page).to have_current_path login_path
      end
    end
  end
  describe "login" do
    let(:user_a) { FactoryBot.create(:user) }
    before do
      FactoryBot.create(:user, name: "test2", email: "test2@test.com")
      visit login_path
      fill_in "session_email", with: login_user.email
      fill_in "session_password", with: login_user.password
      click_button "session_button"
    end
    describe "#show" do
      before do
      end
      let(:login_user) { user_a }

      it "show user name" do
        expect(page).to have_content("test")
      end
      it "show user average" do
        expect(page).to have_content("100 %")
      end
      it "show user results" do
        expect(page).to have_selector("#user-victory1")
      end
      it "do not show no login user name" do
        expect(page).not_to have_content("test2")
      end
    end
    describe "#index" do
      let(:login_user) { user_a }
      before do
        visit users_path
      end
      it "show all user" do
        user_all = all(".l-card")
        expect(user_all[0]).to have_content("test")
        expect(user_all[1]).to have_content("test2")
      end
    end
  end
end
