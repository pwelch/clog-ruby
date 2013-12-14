require 'spec_helper'
require_relative '../lib/clog/log_entry'

describe LogEntry do
  # redefine Socket.gethostname
  # Is there a better way to do this?
  def Socket.gethostname
    return 'rspec.local'
  end

  before(:each) do
    @log_entry = LogEntry.new('Test log entry message.')
    ENV['USER'] = 'rspec-user'
  end

  describe "#data" do
    it "should be a String object" do
      expect(@log_entry.data).to be_kind_of String
    end

    it "should be a JSON string" do
      expect(@log_entry.data).to eq(load_json('send_data.json').to_json)
    end
  end
end
