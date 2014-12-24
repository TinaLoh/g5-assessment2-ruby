class PoemParser

  def initialize(poem)
    @poem = poem
    @poem_lines = poem.lines
  end

  def title
    @poem_lines.first.chomp
  end

  def author
    @poem_lines[1].strip
  end

  def verse_count
    @poem_lines.count("\n")
  end

  def line_count
    # Approach One
    # header_lines = 2
    # extra_lines = header_lines + verse_count
    # @poem_lines.size - extra_lines

    counter = 0
    header_lines = 2
    @poem_lines.each do |line|
      if line != "\n"
        counter += 1
      end
    end
    counter - header_lines
  end

  def hashify
    poem_hash = {}
    poem_verses_lines = {}

    poem_verses_lines[title] = {verses: verse_count, lines: line_count}

    poem_hash[author] = poem_verses_lines
    poem_hash
  end

  def roryify(file_path)
    all_poems_hash = {}
    Dir.glob(file_path).each do |poem_file|
      poem = File.read(poem_file)
      if all_poems_hash.has_key? author
        all_poems_hash[author].store(
        title,
        {
          verses: verse_count,
          lines: line_count
        }
        )
      else
        all_poems_hash[author] = poem.hashify
      end
    end
    all_poems_hash
  end
end

all_the_poems = File.join("**", "data", "**", "*.txt")
files = Dir.glob(all_the_poems)

files.each do |file|
  raw_file = File.read(file)
  PoemParser.new(raw_file)
  p PoemParser.new(raw_file).hashify
end
