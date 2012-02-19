# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'spinaltap/version'

Gem::Specification.new do |s|
  s.name              = "spinaltap"
  s.version           = Spinaltap::VERSION
  s.authors           = ["Florian Plank", "Piotr Gęga"]
  s.email             = ["florian@polarblau.com", "piotrgega@gmail.com"]
  s.homepage          = "https://github.com/polarblau/spinaltap"
  s.summary           = "Yet another Rails / Backbone gem"
  s.description       = "Simplifies working with Backbone on Rails"
     
  s.files             = `git ls-files app lib`.split("\n")
  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.rubyforge_project = '[none]'
             
  s.add_dependency "rails",                               "~> 3.1"
  s.add_dependency "jasmine",                             "~> 1.1.2"
            
  s.add_development_dependency "gem-release",             "~> 0.1.2"
  s.add_development_dependency "minitest",                "~> 2.11.1"
  s.add_development_dependency "guard-minitest",          "~> 0.4.0"
  s.add_development_dependency "mocha",                   "~> 0.10.3"
  s.add_development_dependency "jasmine-headless-webkit", "~> 0.8.4"
  s.add_development_dependency "guard-jasmine-headless-webkit"

end