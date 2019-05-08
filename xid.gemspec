lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xid/version'

Gem::Specification.new do |spec|
  spec.name          = 'xid'
  spec.version       = Xid::VERSION
  spec.authors       = ['Christopher Nelson']
  spec.email         = ['chris@practiceignition.com']

  spec.summary       = 'Xid is a globally unique, lexographically sortable id generator.'
  spec.description   = 'Xid is a globally unique, lexographically sortable id generator.'
  spec.homepage      = 'https://github.com/ignitionapp/xid'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'base32'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '>= 0.68.0'
end
