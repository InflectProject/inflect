# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inflect/version'

Gem::Specification.new do |spec|
  spec.name          = "inflect"
  spec.version       = Inflect::VERSION
  spec.authors       = ["Santiago Figueiras",
                        "Gastón Ambrogi"]
  spec.email         = ["santi.figueiras95@gmail.com",
                        "gastom.ambrogi@gmail.com"]

  spec.summary       = %q{Backend service API support for the inflect-client app.}
  spec.description   = %q{Integrate service API's by following a simple and modular interface.}
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.8"
  spec.add_development_dependency "pry", "~> 0.10.1"
  spec.add_runtime_dependency "thor", "~> 0.19.1"
end
