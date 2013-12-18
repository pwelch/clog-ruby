require 'spec_helper'
require_relative '../lib/clog/transmit'

describe Transmit do
  # New class required variables
  let(:url)       { 'http://clogapp.com/api' }
  let(:api_token) { '05d6085b4efd4ed4ce42fa11fae3cdd4' }
  let(:data)      { load_json('send_data.json').to_json }

  let(:http_class) { Net::HTTP.new(url,80) }
  let(:headers_hash) do
    {
      "Content-Type"  => "application/json",
      "Authorization" => "Token token=#{api_token}"
    }
  end

  before(:each) { @transmit = Transmit.new(url, api_token, data) }

  describe "#http" do
    it "should return an instance of Net::HTTP" do
      expect(@transmit.http).to be_kind_of Net::HTTP
    end
  end

  describe "#post_entry" do
    it "should post to the server" do
      Net::HTTP.any_instance.stub(:post).and_return(Net::HTTPCreated)
      expect(@transmit.post_entry).to be Net::HTTPCreated
    end
  end

  describe "#post_success?" do
    before(:each) do
      Net::HTTP.any_instance.stub(:post).and_return(Net::HTTPResponse)
    end

    context "when Net::HTTPCreated is received" do
      it "should return true" do
        @transmit.post_entry.stub(:class).and_return(Net::HTTPCreated)
        expect(@transmit.post_success?).to eq true
      end
    end

    context "when Net::HTTPCreated is not received" do
      it "should return false" do
        @transmit.post_entry.stub(:class).and_return(Net::HTTPError)
        expect(@transmit.post_success?).to eq false
      end
    end
  end

  describe "#headers" do
    it "should return a Hash object" do
      expect(@transmit.headers).to be_kind_of Hash
    end

    it "should return a HTTP Headers hash" do
      expect(@transmit.headers).to eq headers_hash
    end
  end
end
