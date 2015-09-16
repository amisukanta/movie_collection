require "rails_helper"

RSpec.describe ApplicationHelper, :type => :helper do
  describe "#full_title" do
    it "returns the default title" do
      expect(helper.full_title).to eq("Movie Collections")
    end
  end
end
