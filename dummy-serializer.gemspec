Gem::Specification.new do |s|
  s.name = 'dummy-serializer'
  s.authors = ['Wojciech Korzeniowski']
  s.license = 'Unlicense'
  s.version = '0.0.1'
  s.date = '2020-02-03'
  s.summary = 'awesome_gem is the best'
  s.files = Dir['CHANGELOG.md', 'LICENSE', 'README.md', 'dummy-serializer.gemspec', 'lib/**/*']
  s.require_paths = ['lib']

  s.homepage = 'https://github.com/WojciechKo/dummy-serializer'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
