require 'spec_helper'

describe User do
  describe "associations" do
    it { should have_many :expos }
    it { should have_many :idealogs }
  end
end
