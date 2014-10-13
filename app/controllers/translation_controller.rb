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
    english.split.collect { |w| pig(w) }.join(" ")
  end

  private

  def pig(word)
    leadingCap = word =~ /^A-Z?/
    word.downcase!
    res = case word
      #when vowels word + way
      when /^aeiouy/
        word+"way"
      #otherwise, start from the back to concatanete with the first letter and add ay
      when /^([^aeiouy]+)(.*)/
        $2 + $1 + "ay"
      else
        word
    end
    leadingCap ? res.capitalize : res
  end
end