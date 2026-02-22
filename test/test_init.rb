ENV["CONSOLE_DEVICE"] ||= "stdout"
ENV["LOG_TAGS"] ||= "_all,_untagged"
ENV["LOG_LEVEL"] ||= "_min"

ENV["TEST_BENCH_DETAIL"] ||= ENV["D"]

puts RUBY_DESCRIPTION

require_relative '../init.rb'
require 'env_var/controls'

require 'test_bench'; TestBench.activate

## Replace with import when possible, and remove the
## fully-qualified control constant names in test scripts
## - Scott, Sat Feb 21 2026
## include EnvVar
