
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "eia_fuel/version"

Gem::Specification.new do |spec|
  spec.name          = "eia_fuel"
  spec.version       = EiaFuel::VERSION
  spec.authors       = ["Taylor Stib"]
  spec.email         = ["tstib3@gmail.com"]

  spec.summary       = "Wrapper for the eia.gov fuel prices API"
  spec.description   = "API interface for fetching data published by the US EIA."
  spec.homepage      = "https://github.com/taylorstib/eia_fuel"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency("faraday", ">= 1.0")

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.11"
end
