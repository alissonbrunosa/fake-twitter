require 'rails_helper'

RSpec.describe User, type: :model do
  it "should create a user" do
    user1 = FactoryGirl.create(:user)
    expect(user1.id).not_to be_nil
  end

  it "should add a new follower to user" do
    user = FactoryGirl.create(:user)
    count_followers = user.followers.size
    follower = FactoryGirl.create(:follower)
    user.followers << follower
    expect(user.followers).to have(1).followers
    expect(user.reload.followers).to include(follower)
  end

  it "should be able to view post from whom the user follows" do
    user = FactoryGirl.create(:user)
    user.posts << FactoryGirl.create(:post)
    follower = FactoryGirl.create(:follower)
    user.followers << follower
    expect(follower.feed).to include(*user.posts)
  end

end
