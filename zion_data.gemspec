require File.expand_path('../lib/zion_data/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'zion_data'
  gem.version       = ZionData::VERSION
  gem.date          = '2017-05-12'
  gem.summary       = 'Zion data manager'
  gem.description   = 'Ruby gem to manage zion data'
  gem.authors       = ['Konstantin Lynda']
  gem.email         = 'knlynda@gmail.com'
  gem.files         = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ['lib']
  gem.bindir        = 'bin'
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.homepage      = 'http://rubygems.org/gems/zion_data'
  gem.license       = 'MIT'

  gem.add_runtime_dependency 'rest-client', '2.0.2'
  gem.add_runtime_dependency 'rubyzip', '1.2.1'
end
