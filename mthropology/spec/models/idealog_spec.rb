require 'spec_helper'

describe Idealog do
  describe "associations" do
    it { should belong_to :user }
  end
end
