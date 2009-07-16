
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  
  # Cookie sessions (limit = 4K)
  # WARNING: You MUST generate a new secret (use "rake secret") and add it below!
  config.action_controller.session = {
    :session_key => '_lovd_network',
    :secret      => 'cfd5860aaddef97853bfa904fd3fac08842e1f83ae96d191e46c722d0d243c8985d4a86d547bb8b02b5e6024e980a2e0e433bb5a23faa956cd2762433097fda6' # <- New secret key goes here
  }
  config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper, 
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector

  # Make Active Record use UTC-base instead of local time
  config.time_zone = 'UTC'
  
  # Gem dependencies
  config.gem 'mislav-will_paginate', :version => '~> 2.3.11', :lib => 'will_paginate'
  config.gem 'colored', :version=> '1.1'
  config.gem 'youtube-g', :version=> '0.4.9.9', :lib=>'youtube_g'
  config.gem 'uuidtools', :version=> '1.0.4'
  config.gem 'hpricot', :version=> '0.8.1'
  config.gem 'mocha', :version=> '0.9.3'
  config.gem 'redgreen', :version=> '1.2.2' unless ENV['TM_MODE']
  config.gem 'flickr'
  config.gem 'thoughtbot-paperclip', :version => '2.3.0', :lib => 'paperclip'
  config.gem 'josevalim-rails-footnotes', :lib => 'rails-footnotes'
  config.gem 'RedCloth', :version => '4.2.2'
  config.gem 'freelancing-god-thinking-sphinx', :version => '1.1.24', :lib => 'thinking-sphinx'
  
end

Less::JsRoutes.generate!
