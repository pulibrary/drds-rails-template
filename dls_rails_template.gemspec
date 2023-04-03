lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dls_rails_template/version"

Gem::Specification.new do |spec|
  spec.name = "dls_rails_template"
  spec.version = DlsRailsTemplate::VERSION
  spec.authors = ["Taylor Yamashita"]
  spec.summary = "A template for DLS rails applications"
  spec.license = "Apache 2.0"

  spec.files = `git ls-files -z`.split(%(\x0))
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end