


def analize_poem(file)
  title = nil
  author = nil
  verse_count = 0
  line_count = 0

  file.each_line do |line|
    if title.nil?
      title = line.chomp
      next
    end

    if author.nil?
      author = line.chomp
      next
    end

    if line == "\n"
      verse_count += 1
      next
    end

    line_count += 1
  end

  {
    author: author,
    title: title,
    verses: verse_count,
    lines: line_count,
  }
end

def load_files
  poems_data = {}

  file_names = Dir["../data/*"]
  file_names.each do |file_name|
    file = File.read(file_name)
    poem_meta = analize_poem(file)
    title_info = {poem_meta[:title] => {
      verses: poem_meta[:verses],
      lines: poem_meta[:lines],
    }}

    if poems_data.has_key?(poem_meta[:author])
      poems_data[poem_meta[:author]].merge!(
        title_info
      )

    else
      poems_data.merge!({
        poem_meta[:author] =>
          title_info

      })
    end
  end

  poems_data
end

p load_files






#
# puts title
# puts author
# puts verse_count
# puts line_count
