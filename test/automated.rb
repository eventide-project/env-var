require_relative './test_init'

TestBench::Run.(
  'test/automated',
  exclude: '{_*,*/_*,*sketch*,*_init,*_tests}.rb'
) or exit(false)
