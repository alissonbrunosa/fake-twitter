require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  login_user

  it 'should have a user loged' do
    expect(subject.current_user).to_not eq(nil)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
