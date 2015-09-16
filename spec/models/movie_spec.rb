require "rails_helper"

describe Movie do
  context "will be valid" do
    it "with a title" do
      movie = Movie.new(title: 'test', summary: "it has a summary")
      expect(movie).to be_valid
    end
  end

  context "will be invalid" do
    it "without a title" do
      movie = Movie.new(title: nil)
      expect(movie).not_to be_valid
    end
  end

  context "will be valid" do
    it "with a summary" do
      movie = Movie.new(title: 'test', summary: "it has a summary")
      expect(movie).to be_valid
    end
  end

  context "will be invalid" do
    it "without a summary" do
      movie = Movie.new(summary: nil)
      expect(movie).not_to be_valid
    end
  end
end
