require 'rails_helper'

describe Post, type: :model do
  fixtures :posts
  context "validations" do
    it "require body be set" do
      post = posts(:empty)
      expect(post).to have(1).error_on(:body)
    end

    it "require max size to body be 150 characters" do
      post = posts(:two)
      expect(post).to have(1).error_on(:body)
    end
  end
end
