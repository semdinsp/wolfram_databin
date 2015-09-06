Gem::Specification.new do |s|
  s.name        = "wolfram_databin"
  s.version     = "0.1.6"
  s.author      = "Scott Sproule"
  s.email       = "scott.sproule@ficonab.com"
  s.homepage    = "http://github.com/semdinsp/wolfram_databin"
  s.summary     = "Wolfram databin access"
  s.description = "Upload data to wolfram databin  mathematica via ruby"
  s.executables = ['wolfram.rb']    #should be "name.rb"
  s.files        = Dir["{lib,test}/**/*"] +Dir["bin/*.rb"] + Dir["[A-Z]*"] # + ["init.rb"]
  s.require_path = "lib"
  s.license = 'MIT'
  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end
