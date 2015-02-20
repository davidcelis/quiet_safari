# QuietSafari

Because who cares if Safari can't find `apple-touch-icon.png`?

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'quiet_safari', group: :development
```

And then execute:

```ruby
$ bundle install
```

## Usage

That's it. Be at peace, knowing you can read your development log without seeing it cluttered with this:

```
Started GET "/apple-touch-icon.png" for 127.0.0.1 at 2015-02-20 09:49:14 -0800

ActionController::RoutingError (No route matches [GET] "/apple-touch-icon.png"):
  vendor/bundle/gems/actionpack-3.2.20/lib/action_dispatch/middleware/debug_exceptions.rb:21:in `call'
  vendor/bundle/gems/actionpack-3.2.20/lib/action_dispatch/middleware/show_exceptions.rb:56:in `call'
  vendor/bundle/gems/railties-3.2.20/lib/rails/rack/logger.rb:32:in `call_app'
  vendor/bundle/gems/railties-3.2.20/lib/rails/rack/logger.rb:16:in `block in call'
  vendor/bundle/gems/activesupport-3.2.20/lib/active_support/tagged_logging.rb:22:in `tagged'
  vendor/bundle/gems/railties-3.2.20/lib/rails/rack/logger.rb:16:in `call'
  vendor/bundle/gems/quiet_assets-1.0.3/lib/quiet_assets.rb:23:in `call_with_quiet_assets'
  vendor/bundle/gems/actionpack-3.2.20/lib/action_dispatch/middleware/request_id.rb:22:in `call'
  vendor/bundle/gems/rack-1.4.5/lib/rack/methodoverride.rb:21:in `call'
  vendor/bundle/gems/rack-1.4.5/lib/rack/runtime.rb:17:in `call'
  vendor/bundle/gems/rack-1.4.5/lib/rack/lock.rb:15:in `call'
  vendor/bundle/gems/actionpack-3.2.20/lib/action_dispatch/middleware/static.rb:82:in `call'
  vendor/bundle/gems/rack-mini-profiler-0.9.2/lib/mini_profiler/profiler.rb:300:in `call'
  vendor/bundle/gems/railties-3.2.20/lib/rails/engine.rb:484:in `call'
  vendor/bundle/gems/railties-3.2.20/lib/rails/application.rb:231:in `call'
  vendor/bundle/gems/rack-1.4.5/lib/rack/content_length.rb:14:in `call'
  vendor/bundle/gems/railties-3.2.20/lib/rails/rack/log_tailer.rb:17:in `call'
  vendor/bundle/gems/thin-1.6.2/lib/thin/connection.rb:86:in `block in pre_process'
  vendor/bundle/gems/thin-1.6.2/lib/thin/connection.rb:84:in `catch'
  vendor/bundle/gems/thin-1.6.2/lib/thin/connection.rb:84:in `pre_process'
  vendor/bundle/gems/thin-1.6.2/lib/thin/connection.rb:53:in `process'
  vendor/bundle/gems/thin-1.6.2/lib/thin/connection.rb:39:in `receive_data'
  vendor/bundle/gems/eventmachine-1.0.3/lib/eventmachine.rb:187:in `run_machine'
  vendor/bundle/gems/eventmachine-1.0.3/lib/eventmachine.rb:187:in `run'
  vendor/bundle/gems/thin-1.6.2/lib/thin/backends/base.rb:73:in `start'
  vendor/bundle/gems/thin-1.6.2/lib/thin/server.rb:162:in `start'
  vendor/bundle/gems/rack-1.4.5/lib/rack/handler/thin.rb:13:in `run'
  vendor/bundle/gems/rack-1.4.5/lib/rack/server.rb:268:in `start'
  vendor/bundle/gems/railties-3.2.20/lib/rails/commands/server.rb:70:in `start'
  vendor/bundle/gems/railties-3.2.20/lib/rails/commands.rb:55:in `block in <top (required)>'
  vendor/bundle/gems/railties-3.2.20/lib/rails/commands.rb:50:in `tap'
  vendor/bundle/gems/railties-3.2.20/lib/rails/commands.rb:50:in `<top (required)>'
  script/rails:6:in `require'
  script/rails:6:in `<main>'

```

## Contributing

1. [Fork it](https://github.com/davidcelis/quiet_safari/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
