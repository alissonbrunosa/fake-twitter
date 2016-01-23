require 'rails_helper'

describe Post, type: :model do
  context "validations" do
    it "require body be set" do
      post = FactoryGirl.build(:post, body: nil)
      expect(post).to have(1).error_on(:body)
    end

    it "require max size to body be 150 characters" do
      post = FactoryGirl.build(:two)
      expect(post).to have(1).error_on(:body)
    end
  end
end
