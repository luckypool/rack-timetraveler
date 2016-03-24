# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'rack-timetraveler'
  spec.version       = '0.0.1'
  spec.authors       = ['luckypool']
  spec.email         = ['luckypool314@gmail.com']
  spec.description   = 'You can be a Time Traveler.'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/luckypool/rack-timetraveler'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'timecop'
  spec.add_runtime_dependency 'rack'
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rspec', '~>3.3'
end
