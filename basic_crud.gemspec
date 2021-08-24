require_relative 'lib/basic_crud/version'

Gem::Specification.new do |spec|
  spec.name          = "basic_crud"
  spec.version       = BasicCrud::VERSION
  spec.authors       = ["rongworks"]
  spec.email         = ["info@rongworks.de"]

  spec.summary       = "Adds Basic Crud functionality to any controller"
  spec.description   = "Contains base (overridable) logic for default controller actions index/show/edit/create/update/destroy"
  spec.homepage      = "https://github.com/rongworks/basic_crud"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  #spec.metadata["changelog_uri"] = "#{spec.homepage}/chanhelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rspec-rails'
end
