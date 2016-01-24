require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user

  describe "GET #autocomplete" do
    it "should return combinations" do
      user = FactoryGirl.create(:user)
      get :autocomplete, format: :json, term: "Fake u"
      expect(response).to have_http_status(:success)
      expect(assigns(:users)).to include(user)
    end
  end

  describe "PATCH follow" do 
    before(:each) do 
      @user = FactoryGirl.create(:user)
    end

    it "should return http found" do
      patch :follow, id: @user
      expect(response).to have_http_status(:found)
    end

    it "should have a new following" do
      expect {
        patch :follow, id: @user
      }.to change(subject.current_user.following, :count).from(0).to(1)
    end

    it "should redirect to user profile" do
      patch :follow, id: @user
      expect(response).to redirect_to(@user)
    end
  end

  describe "PATCH unfollow" do
    before(:each) do 
      @user = FactoryGirl.create(:user)
      patch :follow, id: @user
    end

    it "should return http found" do
      patch :unfollow, id: @user
      expect(response).to have_http_status(:found)
    end

    it "should remove following" do
      expect {
        patch :unfollow, id: @user
      }.to change(subject.current_user.following, :count).from(1).to(0)
    end

    it "should redirect to user profile" do
      patch :unfollow, id: @user
      expect(response).to redirect_to(@user)
    end
  end

end
