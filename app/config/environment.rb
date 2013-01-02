# Load the rails application
require File.expand_path('../application', __FILE__)

ENV['GOOGLE_KEY'] = '785214922392.apps.googleusercontent.com'
ENV['GOOGLE_SECRET'] = 'rKEW9WF8i_NCXRaZCUH0nQJK'

# Initialize the rails application
App::Application.initialize!
