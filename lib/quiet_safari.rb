require 'quiet_safari/version'
require 'logger'

module QuietSafari
  class Engine < ::Rails::Engine
    config.quiet_safari = true

    APPL = /apple-touch-icon(-precomposed)?.*/
    KEY = 'quiet_safari.old_rails_log_level'

    initializer 'quiet_safari' do |app|
      next if Rails::Rack::Logger.instance_methods.include?(:call_with_quiet_safari)

      Rails::Rack::Logger.class_eval do
        def call_with_quiet_safari(env)
          begin
            if Rails.application.config.quiet_safari and env['PATH_INFO'] =~ APPL
              env[KEY]           = Rails.logger.level
              Rails.logger.level = Logger::UNKNOWN
            end

            call_without_quiet_safari(env)
          ensure
            Rails.logger.level = env[KEY] if env[KEY]
          end
        end

        alias :call_without_quiet_safari :call
        alias :call :call_with_quiet_safari
      end
    end
  end
end
