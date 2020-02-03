Gem::Specification.new do |s|
  s.name = 'dummy-serializer'
  s.summary = 'Dummy serialization'
  s.version = '0.0.2'
  s.date = '2020-02-03'

  s.license = 'Unlicense'
  s.homepage = 'https://github.com/WojciechKo/dummy-serializer'
  s.authors = ['Wojciech Korzeniowski']

  s.files = Dir['LICENSE', 'README.md', 'dummy-serializer.gemspec', 'lib/**/*']
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
