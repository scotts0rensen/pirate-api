class Piglatin

  def translate english
    # credit:  http://codereview.stackexchange.com/questions/40189/pig-latin-translator-in-ruby-and-rspec
    english.gsub!(/\w+/) { |word| pig(word) }
  end

  private

  def pig(word)
    replace_consonants_to_end_of_word(word)
    append_n_to_last_letter_y(word) or append_y_to_last_letter_vowel(word)
    recapitalize(word)
    word += 'ay'
  end

  def replace_consonants_to_end_of_word(word)
    word.concat(word.slice!(/^[^aeiou]*/i || ""))
  end

  def append_n_to_last_letter_y(word)
    word.gsub!(/y$/, "yn")
  end

  def append_y_to_last_letter_vowel(word)
    word.gsub!(/([aeiou])$/, '\1y')
  end

  def recapitalize(word)
    word.capitalize! if word.downcase!
  end

end