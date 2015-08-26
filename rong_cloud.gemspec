# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rong_cloud/version'

Gem::Specification.new do |spec|
  spec.name          = "rong_cloud"
  spec.version       = RongCloud::VERSION
  spec.authors       = ["Jun Lin"]
  spec.email         = ["linjunpop@gmail.com"]

  spec.summary       = %q{Unofficial RongCloud API wrapper.}
  spec.description   = %q{Unofficial RongCloud API wrapper.}
  spec.homepage      = "https://github.com/linjunpop/rong_cloud"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-doc"
  spec.add_development_dependency "httplog"
end
