require 'json'

class LogEntry
  attr_reader :data

  def initialize(log_entry)
    @data = build_message(log_entry)
  end

  def build_message(log_entry)
    {
      "event" => {
        "entry"    => log_entry,
        "hostname" => get_hostname,
        "user"     => get_username
      }
    }.to_json
  end

  private
    def get_hostname
      Socket.gethostname
    end

    def get_username
      ENV['USER']
    end
end
