require 'pp'
require 'json'
require 'restclient'
require 'hyperledger_cli/version'
require_relative 'hyperledger_cli/error_printer'

include HyperledgerCli::ErrorPrinter

module HyperledgerCli  
  def post(url, data, key = nil)
    json_data = data.to_json
    headers = {
      content_type: :json,
      accept: 'application/vnd.uber-amundsen+json'
    }
    if key
      sig = key.sign(json_data)
      headers.merge!({
        authorization: "Hyper Key=#{key.public_key}, Signature=#{sig}"
      })
    end
    
    begin
      response = RestClient.post(url, json_data, headers)
      pp JSON.parse(response)["uber"]["data"]
    rescue => e
      print_error(e)
    end
  end
  
  def get(url)
    begin
      response = RestClient.get(url, accept: 'application/vnd.uber-amundsen+json')
      pp JSON.parse(response)["uber"]["data"]
    rescue => e
      print_error(e)
    end
  end
end
