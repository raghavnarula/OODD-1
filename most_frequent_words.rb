def most_frequent_word(s)
  # converting sentence into array
  words = s.downcase.split(/[!?'.,; ]/)

  # Create a dictionary to store all the words only..
  dictionary = Hash.new(0)
  words.each_with_index do |word, index|
    if word != ""
      dictionary[word] += 1
    end
  end

  max_frequency = dictionary.values.max

  # Selecting the most frequent words from a dictionary
  most_freq_words = dictionary.select { |_, count| count == max_frequency }

  # Selecting the earliest word
  earliest_word = nil
  words.each_with_index do |word, index|
    if most_freq_words.include?(word) && (earliest_word.nil? || words.index(earliest_word) > index)
      earliest_word = word
    end
  end

  earliest_word
end
