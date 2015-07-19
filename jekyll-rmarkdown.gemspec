# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-rmarkdown/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-rmarkdown"
  spec.version       = Jekyll::Rmarkdown::VERSION
  spec.authors       = ["Adam Bradley"]
  spec.email         = ["hisself@adambradley.net"]
  spec.summary       = %q{Jekyll RMarkdown converter}
  spec.homepage      = "https://github.com/atbradley/jekyll-rmarkdown"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jekyll", "~> 2.5"
  spec.add_runtime_dependency "rinruby", "~> 2.0"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
