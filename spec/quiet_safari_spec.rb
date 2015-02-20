require 'spec_helper'

require 'rails'
require 'rails/all'

require 'quiet_safari'

RSpec.describe QuietSafari do
  def app
    @app ||= Class.new(Rails::Application) do
      config.active_support.deprecation = :notify
      config.secret_token = '685e1a60792fa0d036a82a52c0f97e42'
      config.eager_load = false

      initialize!
    end
  end

  let(:request)  { Rack::MockRequest.env_for(path) }
  let(:response) { StringIO.new }

  before { Rails.logger = Logger.new(response) }

  shared_examples_for 'a quiet request' do
    before { app.config.quiet_safari = true }

    it 'does not output errors' do
      app.call request

      expect(response.string).to be_empty
    end
  end

  context 'configured to be quiet' do
    context 'requesting /apple-touch-icon.png' do
      let(:path) { '/apple-touch-icon.png' }

      it_behaves_like 'a quiet request'
    end

    context 'requesting /apple-touch-icon-precomposed.png' do
      let(:path) { '/apple-touch-icon-precomposed.png' }

      it_behaves_like 'a quiet request'
    end
  end

  shared_examples_for 'a noisy request' do
    before { app.config.quiet_safari = false }

    it 'outputs errors' do
      app.call request

      expect(response.string).to include("Started GET \"#{path}\"")
      expect(response.string).to include('ActionController::RoutingError')
    end
  end

  context 'not configured to be quiet' do
    context 'requesting /apple-touch-icon.png' do
      let(:path) { '/apple-touch-icon.png' }

      it_behaves_like 'a noisy request'
    end

    context 'requesting /apple-touch-icon-precomposed.png' do
      let(:path) { '/apple-touch-icon-precomposed.png' }

      it_behaves_like 'a noisy request'
    end
  end
end
