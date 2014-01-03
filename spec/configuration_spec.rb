require 'spec_helper'
require_relative '../lib/clog/configuration'

describe Configuration do
  let(:yaml_config) { File.expand_path('../../examples/clog_config.yml', __FILE__) }
  let(:json_config) { File.expand_path('../../examples/clog_config.json', __FILE__) }

  describe ".load" do
    context "Loading a YAML configuration file" do
      it "should return data as a hash" do
        expect(Configuration.load(yaml_config)).to be_kind_of Hash
      end
    end

    context "Loading a JSON configuration file" do
      it "should return data as a hash" do
        expect(Configuration.load(json_config)).to be_kind_of Hash
      end
    end
  end
end
