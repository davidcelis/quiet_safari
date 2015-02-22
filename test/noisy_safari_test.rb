require 'test_helper'

App.config.quiet_safari = false
App.initialize!

class NoisySafariTest < QuietSafari::TestCase
  def test_requesting_apple_touch_icon_noisy
    path = '/apple-touch-icon.png'

    get path

    assert_includes log.string, "Started GET \"#{path}\""
  end

  def test_requesting_apple_touch_icon_precomposed_noisy
    path = '/apple-touch-icon-precomposed.png'

    get path

    assert_includes log.string, "Started GET \"#{path}\""
  end
end
