require 'net/http'
require 'uri'

class Transmit
  attr_accessor :api_token, :data, :uri

  def initialize(url, api_token, data)
    @api_token = api_token
    @data      = data
    @uri       = URI(url)
  end

  def http
    @_http ||= Net::HTTP.new(uri.host, uri.port)
  end

  def post_entry
    @_response ||= http.post(uri.path, data, headers)
  end

  def post_success?
    post_entry.class == Net::HTTPCreated ? true : false
  end

  def headers
    {
      "Content-Type"  => "application/json",
      "Authorization" => "Token token=#{api_token}"
    }
  end
end
