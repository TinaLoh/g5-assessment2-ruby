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
end
