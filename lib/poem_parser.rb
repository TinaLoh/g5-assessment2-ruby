class PoemParser

  def initialize(poem)
      @poem = poem
  end

  def title
    @poem.lines.first.chomp
  end

  def author
    poem_lines = @poem.lines
    poem_lines[1].strip
  end
    
end
