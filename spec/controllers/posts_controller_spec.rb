require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  login_user
  describe "POST #create" do
    it "should create a post" do
      post_param = {
        body: "Teste post fake"
      }
      expect(subject.current_user.posts).to receive(:create).with(post_param)
      xhr :post, :create, post: post_param
      expect(response).to have_http_status(:success)
      expect(response).to render_template("create")
    end
  end

  describe "DELETE #destroy" do
    it "should destroy a post" do
      post_param = {
        body: "Teste post fake"
      }
      xhr :post, :create, post: post_param
      expect{
        xhr :post, :destroy, id: assigns(:post).id
      }.to change(Post,:count).by(-1)
      expect(response).to have_http_status(:success)
      expect(response).to render_template("destroy")
    end
  end
end
