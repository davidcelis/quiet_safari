$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'quiet_safari/version'

Gem::Specification.new do |spec|
  spec.name          = 'quiet_safari'
  spec.version       = QuietSafari::VERSION
  spec.authors       = ['David Celis']
  spec.email         = ['me@davidcel.is']

  spec.summary       = %q{Because who cares about the apple-touch-icon?}
  spec.description   = <<-DESCRIPTION
Get rid of ActionController::RoutingErrors that happen when Safari requests PNGs
that don't exist, such as `apple-touch-icon.png` or, of course, the illustrious
`apple-touch-icon-precomposed.png`. Because who cares?
DESCRIPTION

  spec.homepage      = 'https://github.com/davidcelis/quiet_safari'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb']
  spec.test_files    = Dir['spec/**/*.rb']
  spec.require_paths = ['lib']
end
