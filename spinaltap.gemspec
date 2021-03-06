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
     
  s.files             = `git ls-files lib vendor`.split("\n")
  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.rubyforge_project = '[none]'
             
  s.add_dependency "rails",                               "~> 3.1"

  s.add_development_dependency "gem-release",             "~> 0.1.2"
  s.add_development_dependency "minitest",                "~> 2.11.1"
  s.add_development_dependency "guard-minitest",          "~> 0.4.0"
  s.add_development_dependency "mocha",                   "~> 0.10.3"
  s.add_development_dependency "coffee-script",           "~> 2.2.0"
  s.add_development_dependency "execjs",                  "~> 1.3.0"
  # s.add_development_dependency "johnson"
  # s.add_development_dependency "mustang"
  s.add_development_dependency "therubyracer"
  s.add_development_dependency "therubyrhino"

end