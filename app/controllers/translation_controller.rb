class TranslationController < ApplicationController
  def translate
    translation = translate2Pirate params[:english]
    render :json => {pirate: translation}, :callback => params[:callback]
  end

  private

  def translate2Pirate english
    response = HTTParty.get( URI::escape "http://www.pir.to/api/translate?english=#{english}" )
    response.body
  end

end