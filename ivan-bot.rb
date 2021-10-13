require 'net/http'
require 'uri'
require 'json'
require 'yaml'
require_relative 'messages'

class IvanBot
  def self.send_message(text)
    uri = URI.parse(ENV["SLACK_WEBHOOK_URL"])
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request.body = JSON.dump({
      "text" => text
    })

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
  end
end


IvanBot.send_message(Message.morning)
