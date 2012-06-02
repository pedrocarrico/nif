$:.push File.expand_path('../lib', __FILE__)
require 'nif/version'

Gem::Specification.new do |s|
  s.name        = 'nif'
  s.version     = Nif::VERSION
  s.date        = '2012-06-02'
  s.summary     = "Nif - Portuguese NIF generator and validator"
  s.description = "This gem covers the generation and validation of the Portuguese Fiscal Code (or NIF). It also includes a rails custom validator."
  s.authors     = ["Pedro Carriço"]
  s.email       = 'pedro.carrico@gmail.com'
  s.files       = `git ls-files -- lib/*`.split("\n") + %w(README.md LICENSE)
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage    = 'http://github.com/pedrocarrico/nif'
end
