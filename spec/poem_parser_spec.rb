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

  it "hashifies the poem" do
    input = PoemParser.new(@poem)

    expected = {
      "Henry Lawson" => {
        "In Possum Land" => {
          verses: 2,
          lines: 8,
      } ,
    },
  }

    expect(input.hashify).to eq(expected)
  end

  it "returns all the files in data directory " do

    files = Dir.glob("*/*.txt")


    expected = [
      "data/poem_01.txt",
      "data/poem_02.txt",
      "data/poem_03.txt",
      "data/poem_04.txt",
      "data/poem_05.txt",
      "data/poem_06.txt",
      "data/poem_07.txt",
      "data/poem_08.txt",
      "data/poem_09.txt",
      ]

    expect(files).to eq(expected)
  end

end
