#!/usr/bin/env rake
require 'rake/testtask'

namespace :test do
  Rake::TestTask.new do |t|
    t.name = :quiet

    t.libs << 'test'
    t.test_files = Dir['test/quiet_safari_test.rb']
    t.verbose = true
  end

  Rake::TestTask.new do |t|
    t.name = :noisy

    t.libs << 'test'
    t.test_files = Dir['test/noisy_safari_test.rb']
    t.verbose = true
  end
end

task default: ['test:quiet', 'test:noisy']
