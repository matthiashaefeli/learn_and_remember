# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

Rails.logger = Logger.new(STDOUT)
Rails.logger.level = Logger::DEBUG
Rails.logger.datetime_format = "%Y-%m-%d %H:%M:%S"

class MyAppFormatter < Logger::Formatter
  def call(severity, time, programName, message)
      "#{datetime}, #{severity}: #{message} from #{programName}\n"
  end
end

