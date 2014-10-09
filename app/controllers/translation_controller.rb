class TranslationController < ApplicationController
  def translate
    pirate = translate2Pirate params[:english]
    render :json => {pirate: pirate}, :callback => params[:callback]
  end

  def translation
    pirate = translate2Pirate params[:english]
    render :json => {pirate: pirate}, :callback => params[:callback]
  end

  private

  def translate2Pirate english
    response = HTTParty.get( URI::escape "http://www.pir.to/api/translate?english=#{english}" )
    response.body
  end

end