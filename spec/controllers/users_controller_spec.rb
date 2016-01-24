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

end
