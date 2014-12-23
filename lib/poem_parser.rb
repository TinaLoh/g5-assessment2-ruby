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

  def verses
    @poem_lines.count("\n")
  end
end
