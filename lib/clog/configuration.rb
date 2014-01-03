require 'json'
require 'yaml'

class Configuration
  def self.load(file)
    if File.extname(file) == ".yml"
      YAML.load_file(file)
    elsif File.extname(file) == ".json"
      JSON.load(File.read(file))
    else
      print "Unable to load file: #{file}"
      exit 1
    end
  end
end
