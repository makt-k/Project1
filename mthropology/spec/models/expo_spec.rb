require 'spec_helper'

describe Expo do
  describe "associations" do
    it { should belong_to :user }
  end
end

