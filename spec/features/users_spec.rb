require 'rails_helper'

describe "Users", type: :feature do
  describe "get /" do
    it "authenticate user" do
      user = FactoryGirl.create(:user)
      visit '/'
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button 'Log in'
      expect(current_path).to eq('/home')
    end

    it "sign up" do
      visit '/users/sign_up'
      fill_in "Name", with: "Alisson Bruno"
      fill_in "Email", with: "alissonbruno.sa@gmail.com"
      fill_in "Password", with: "123456789"
      fill_in "Password confirmation", with: "123456789"
      click_button 'Inscreva-se'
      expect(current_path).to eq('/home')
      expect(page).to have_content("Alisson Bruno")
      expect(page).to have_content("alissonbruno.sa@gmail.com")
    end
  end
end
