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

App.initialize!

module QuietSafari
  class TestCase < ActionDispatch::IntegrationTest
    attr_reader :log

    setup do
      @log = StringIO.new

      Rails.logger = Logger.new(log)
    end
  end
end

class QuietSafariTest < QuietSafari::TestCase
  def test_requesting_apple_touch_icon_quiet
    get '/apple-touch-icon.png'

    assert_empty log.string
  end

  def test_requesting_apple_touch_icon_precomposed_quiet
    get '/apple-touch-icon-precomposed.png'

    assert_empty log.string
  end

  def test_multithreaded
    t1 = Thread.new do
      sleep 0.1
      get '/apple-touch-icon.png'
    end

    t2 = Thread.new do
      sleep 0.1
      get '/'
    end

    t3 = Thread.new do
      sleep 0.1
      get '/apple-touch-icon.png'
    end

    [t1, t2, t3].each(&:join)

    assert_includes log.string, "Started GET \"/\""
    refute_includes log.string, 'apple-touch-icon'
  end
end

class NoisySafariTest < QuietSafari::TestCase
  setup { App.config.quiet_safari = false }

  def test_requesting_apple_touch_icon_noisy
    App.config.quiet_safari = false

    path = '/apple-touch-icon.png'

    get path

    assert_includes log.string, "Started GET \"#{path}\""
  end

  def test_requesting_apple_touch_icon_precomposed_noisy
    App.config.quiet_safari = false

    path = '/apple-touch-icon-precomposed.png'

    get path

    assert_includes log.string, "Started GET \"#{path}\""

    App.config.quiet_safari = true
  end

  teardown { App.config.quiet_safari = true }
end
