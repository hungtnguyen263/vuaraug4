$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "erp/vuaraug4/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "erp_vuaraug4"
  s.version     = Erp::Vuaraug4::VERSION
  s.authors     = ["Hung Nguyen"]
  s.email       = ["tonhungstar@gmail.com"]
  s.homepage    = "http://globalnaturesoft.com"
  s.summary     = "Vuaraug4 features of Erp System."
  s.description = "Vuaraug4 features of Erp System."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "erp_core"
  s.add_dependency "deface"
end
