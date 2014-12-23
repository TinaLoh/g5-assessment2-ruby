require "spec_helper"
require "poem_parser"

describe PoemParser do
  before do
      @poem = "In Possum Land
      Henry Lawson

      In Possum Land the nights are fair,
      the streams are fresh and clear;
      no dust is in the moonlit air;
      no traffic jars the ear.

      With Possums gambolling overhead,
      'neath western stars so grand,
      Ah! would that we could make our bed
      tonight in Possum Land"
  end

  it "returns the title of a poem" do
      input = PoemParser.new(@poem)

      expect(input.title).to eq("In Possum Land")

  end

  it "returns the author of a poem" do
    input = PoemParser.new(@poem)

    expect(input.author).to eq("Henry Lawson")
  end

  it "returns the number of verses in the poem" do
    input = PoemParser.new(@poem)

    expect(input.verse_count).to eq(2)
  end

  it "returns the number of lines in the poem" do
    input = PoemParser.new(@poem)

    expect(input.line_count).to eq(8)
  end
    

end
