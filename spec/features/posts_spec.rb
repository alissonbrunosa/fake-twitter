require 'rails_helper'

describe "Posts", type: :feature do
  describe "POST /posts" do
    before(:each) do 
      @password = "12345678"
      @user = FactoryGirl.create(:user)
    end

    it "create post", js: true do
      login_as(@user)
      home = Home.new
      home.load
      home.body.set "Teste postando"
      home.send.click
      expect(page).to have_content("Teste postando")
    end
  end
end
