# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Coffeecup::Application.initialize!

ActiveRecord::Base.logger.level = Logger::DEBUG
