require 'json'

RSpec.configure do |config|
  # always show ansi colors
  config.tty = true

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end

# helper method for loading JSON files
def load_json(filename)
  File.open(File.expand_path("../support/#{filename}", __FILE__), "r") do |json_file|
    JSON.load(json_file)
  end
end
