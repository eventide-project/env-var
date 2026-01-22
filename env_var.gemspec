# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = "evt-env_var"
  s.summary = "Temporarily set environment variable values by treating the environment as a stack, and using blocks to control scope"
  s.version = "2.1.0.1"
  s.description = " "

  s.authors = ["The Eventide Project"]
  s.email = "opensource@eventide-project.org"
  s.homepage = "https://github.com/eventide-project/env-var"
  s.licenses = ["MIT"]

  s.require_paths = ["lib"]
  s.files = Dir.glob("{lib}/**/*")
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = ">= 3.0"

  s.add_runtime_dependency "evt-log"

  s.add_development_dependency "test_bench"
end
