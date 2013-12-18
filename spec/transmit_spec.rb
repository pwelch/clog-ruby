require 'spec_helper'
require_relative '../lib/clog/transmit'

describe Transmit do
  let(:url)       { 'http://clogapp.com/api' }
  let(:api_token) { '05d6085b4efd4ed4ce42fa11fae3cdd4' }
  let(:data)      { load_json('send_data.json').to_json }

  let(:headers_hash) do
    {
      "Content-Type"  => "application/json",
      "Authorization" => "Token token=#{api_token}"
    }
  end

  before(:each) { @transmit = Transmit.new(url, api_token, data) }

  describe "#headers" do
    it "should return HTTP Headers hash" do
      expect(@transmit.headers).to eq headers_hash
    end
  end
end
