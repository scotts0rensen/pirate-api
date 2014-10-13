class Pirate

  def translate english
    response = HTTParty.get( URI::escape "http://www.pir.to/api/translate?english=#{english}" )
    response.body
  end

end