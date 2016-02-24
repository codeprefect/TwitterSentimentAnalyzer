module Helper
  # Sort Hashes in descending frequencing
  def Helper.sort_hash_descend(value)
    sorted_hash = Hash.new
    value.sort_by { |_x, y| -y }.each do |val|
      sorted_hash[val[0]] = val[1]
    end
    sorted_hash
  end

  # Counts the occurence of words in a string and returns 'word => frequency'
  def Helper.words_counter(sentence)
    word_list = sentence.split(" ")
    word_map = Hash.new
    word_list.each do |word|
      if word_map.key?(word)
        word_map[word] += 1
      else
        word_map[word] = 1
      end
    end
    word_map
  end

  def Helper.stop_words_remover(tweets_lines)
    tweets = tweets_lines
    stop_words_file = File.open("stop_words.json", "r+")
    stop_words = []
    stop_words_file.each { |x| stop_words << x}
    stop_words = stop_words.join(" ").split(',')
    stop_words_free = []
    tweets.each do |word|
      stop_words.include?word ? nil : stop_words_free << word
    end
    stop_words_free
  end
end
