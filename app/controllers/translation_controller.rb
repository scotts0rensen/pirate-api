class TranslationController < ApplicationController
  def translate
    t = translateEnglish( params[:english], params[:language] || "pirate")
    render :json => t, :callback => params[:callback]
  end

  def translation
    t = translateEnglish( params[:english], params[:language] || "pirate")
    render :json => t, :callback => params[:callback]
  end

  def translateEnglish(english, language)
    if language == "pirate"
      {pirate: Pirate.new.translate(english)}
    elsif language == "yoda"
      {yoda: Yoda.new.translate(english)}
    elsif language == "piglatin"
      {piglatin: Piglatin.new.translate(english)}
    elsif language == "dug"
      {dug: Dug.new.translate(english)}
    else
      {error: "invalid language: '#{language}'"}
    end
  end
end