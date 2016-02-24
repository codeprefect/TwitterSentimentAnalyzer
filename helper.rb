module Helper
  # Sort Hashes in descending frequencing
  def sort_hash_descend(value)
    sorted_hash = Hash.new
    value.sort_by { |_x, y| -y }.each do |val|
      sorted_hash[val[0]] = val[1]
    end
    sorted_hash
  end

  # Counts the occurence of words in a string and returns 'word => frequency'
  def words_counter(sentence)
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
end
