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

  describe "#translation" do
    it "should have correct body" do
      get :translation, {english: "Hi Jacob.", callback: "cb"}
      response.should be_ok
      response.body.should eq "cb({\"pirate\":\"Ahoy Jacob.\"})"
    end

    it "should have correct body" do
      get :translation, {english: "How are you woman?", callback: "cb"}
      response.should be_ok
      response.body.should eq "cb({\"pirate\":\"How are ye wench?\"})"
    end

    it "translates pig latin" do
      get :translation, {english: "How are you woman?", language: "piglatin", callback: "cb"}
      response.should be_ok
      response.body.should eq "cb({\"piglatin\":\"Owhay areyay ouynay omanway?\"})"
    end

    it "translates dug" do
      get :translation, {english: "How are you woman?", language: "dug", callback: "cb"}
      response.should be_ok
      response.body.should eq "cb({\"dug\":\"How are you woman?.... SQUIRREL!\"})"
    end
  end
end

