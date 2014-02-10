require 'spec_helper'

describe User do

  describe "validations" do
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email) }
  end

  describe "associations" do
    it { should have_many :expos }
    it { should have_many :idealogs }
  end
end
