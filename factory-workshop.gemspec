lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "factory/version"

Gem::Specification.new do |spec|
  spec.name          = "factory"
  spec.version       = Factory::VERSION
  spec.authors       = ["David Kramer"]
  spec.email         = ["david.kramer@redtailtechnology.com"]

  spec.summary       = "Workshop on creating domain specific languages in Ruby"
  spec.homepage      = "http://redtailtechnology.com"

  spec.metadata["allowed_push_host"] = "http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://redtailtechnology.com"
  spec.metadata["changelog_uri"] = "http://redtailtechnology.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
end
