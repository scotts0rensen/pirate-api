require 'spec_helper'

describe TranslationController do
  describe "#translate" do
    it "should have correct body" do
      post :translate, {english: "Hi Jacob.", callback: "cb"}
      response.should be_ok
      response.body.should eq "cb({\"pirate\":\"Ahoy Jacob.\"})"
    end

    it "should have correct body" do
      post :translate, {english: "How are you woman?", callback: "cb"}
      response.should be_ok
      response.body.should eq "cb({\"pirate\":\"How are ye wench?\"})"
    end
  end
end

