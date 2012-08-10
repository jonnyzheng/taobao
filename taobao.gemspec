$:.push File.expand_path("../lib", __FILE__)

require "taobao/version"

Gem::Specification.new do |s|
  s.name        = "taobao"
  s.version     = Taobao::VERSION
  s.authors     = ["Anton Kravchenko"]
  s.email       = ["anton.kravchenko@gmail.com"]
  s.homepage    = "http://kupitao.com"
  s.summary     = "Entities for taobao.com"
  s.description = "The plugin enable easy integration with the Taobao Open Platform. Based on github.com/taweili/taobao."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 3.1"

end
