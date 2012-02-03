# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'vertebrae/version'

Gem::Specification.new do |s|
  s.name         = "vertebrae"
  s.version      = Vertebrae::VERSION
  s.authors      = ["Piotr Gęga", "Florian Plank"]
  s.email        = "florian@polarblau.com"
  s.homepage     = "https://github.com/polarblau/vertebrae"
  s.summary      = "Yet another Rails / Backbone gem"
  s.description  = "Simplifies working with Backbone on Rails"

  s.files        = `git ls-files app lib`.split("\n")
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.rubyforge_project = '[none]'
end
