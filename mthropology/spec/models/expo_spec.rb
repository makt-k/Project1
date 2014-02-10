require 'spec_helper'

describe Expo do
  describe "associations" do
    it { should belong_to :user }
  end

  describe "GET index with serach params" do
    before :each do
      @expo1 = Expo.create(title: "title", body: "body", tag: "test")
      @expo2 = Expo.create(title: "title2", body: "body2", tag: "test")
    end
    it "returns an array of expos with the searched tag" do
      expect(Expo.search("test")).to eq [@expo1, @expo2]
    end
  end
end

