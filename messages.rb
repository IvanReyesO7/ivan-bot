require 'date'
require 'yaml'
require_relative 'weather'

class Message   
  def self.morning
    message = "*Good morning team!*" + "\n"
    message += "Today is `#{(Date.today + 1).strftime('%b %d, %Y')}`" + "\n"
    message += WeatherAPI.fetch_weather("tokyo") + "\n"
    message += "Let's give our best today 💪🏽" + "\n"
    random_fact = YAML.load_file('fun-facts.yml')["fun-facts"].sample
    message += "*Fun fact of th day:* " + random_fact
    return message
  end
end
