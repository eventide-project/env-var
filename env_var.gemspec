# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = "evt-env_var"
  s.summary = "Temporarily set environment variable values by treating the environment as a stack, and using blocks to implicitly control scope"
  s.version = '0.0.0.0'
  s.description = ' '

  s.authors = [""]
  s.email = ""
  s.homepage = ""
  s.licenses = ["Nonstandard"]

  s.require_paths = ["lib"]
  s.files = Dir.glob("{lib}/**/*")
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = ">= 3.0"

  s.add_runtime_dependency "evt-log"
end
