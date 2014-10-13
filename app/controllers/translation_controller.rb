class TranslationController < ApplicationController
  def translate
    pirate = translate2Pirate params[:english]
    render :json => {pirate: pirate}, :callback => params[:callback]
  end

  def translation
    pirate = translate2Pirate params[:english]
    render :json => {pirate: pirate}, :callback => params[:callback]
  end

  def translate2Pirate english
    response = HTTParty.get( URI::escape "http://www.pir.to/api/translate?english=#{english}" )
    response.body
  end

  def translate2PigLatin english
    # credit:  http://codereview.stackexchange.com/questions/40189/pig-latin-translator-in-ruby-and-rspec
    english.gsub!(/\w+/) { |word| pig(word) }
  end

  def translate2Dug english
    english.split.first(5).join(" ") + ".... SQUIRREL!"
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