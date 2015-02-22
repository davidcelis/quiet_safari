$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'minitest/autorun'

require 'rails'
require 'rails/all'

require 'quiet_safari'

class App < Rails::Application
  configure do
    config.active_support.deprecation = :notify
    config.secret_token = '7f6387a1b470361762a17fc52103498677736f38'
    config.secret_key_base = config.secret_token
    config.eager_load = false

    routes { root to: 'application#index' }
  end
end

class ApplicationController < ActionController::Base
  def index
    render text: 'Hello, world!'
  end
end


module QuietSafari
  class TestCase < ActionDispatch::IntegrationTest
    attr_reader :log

    setup do
      @log = StringIO.new

      Rails.logger = Logger.new(log)
    end
  end
end
