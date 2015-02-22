require 'test_helper'

App.initialize!

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
