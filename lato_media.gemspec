$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lato_media/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lato_media"
  s.version     = LatoMedia::VERSION
  s.authors     = ["Ideonetwork"]
  s.email       = ["info@ideonetwork.it"]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  # Dependencies:

  s.add_dependency "rails", "~> 5.1.0"
  s.add_dependency "lato_core"

  # attachments management
  # doc: https://github.com/thoughtbot/paperclip
  s.add_dependency "paperclip", ">= 5.0.0"

  # Dev dependencies:

  s.add_development_dependency "sqlite3"

end
