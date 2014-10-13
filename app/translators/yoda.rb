class Yoda
  def translate english
    binding.pry
    client = Savon.client(wsdl: "http://www.yodaspeak.co.uk/webservice/yodatalk.php?wsdl")
    response = client.call(:yoda_talk, message: {input_text: english})
    response.body[:yoda_talk_response][:return]
  end
end