## Prints the whole suite's context/test hierarchy as one tree, with duplicate
## outer contexts merged so each context path appears once. The run's own
## narration goes to stderr and the tree to stdout, so the tree alone is:
##
##   ruby test/automated/_tree.rb 2>/dev/null
##
## The leading underscore keeps this file out of the default suite run, via the
## */_* exclusion pattern in test/automated.rb. The exclusion patterns are
## matched against the whole relative path, so a bare _* would not match.

ENV["TEST_BENCH_OUTPUT_DEVICE"] ||= "stderr"

## The initialization script announces the Ruby version on stdout, which is
## where the tree goes
$stdout = STDERR
require_relative '../test_init'
$stdout = STDOUT

module Tree
  class Node
    def children
      @children ||= {}
    end

    def tests
      @tests ||= []
    end

    def child(title)
      children[title] ||= Node.new
    end

    def test(title)
      return if tests.include?(title)

      tests << title
    end
  end

  class Sink
    include TestBench::Telemetry::Sink::Handler

    def root
      @root ||= Node.new
    end

    def stack
      @stack ||= [root]
    end

    def current
      stack.last
    end

    handle TestBench::Session::Events::ContextStarted do |context_started|
      title = context_started.title

      if title.nil?
        node = current
      else
        node = current.child(title)
      end

      stack.push(node)
    end

    handle TestBench::Session::Events::ContextFinished do |context_finished|
      stack.pop
    end

    handle TestBench::Session::Events::TestFinished do |test_finished|
      title = test_finished.title

      next if title.nil?

      current.test(title)
    end
  end

  def self.print(root, device)
    root.children.each do |title, node|
      device.puts(title)

      print_branch(node, device)
    end
  end

  def self.print_branch(node, device, prefix=nil)
    prefix ||= ''

    contexts = node.children.keys
    tests = node.tests

    entries = contexts.length + tests.length

    contexts.each_with_index do |title, index|
      last = index == entries - 1
      connector = last ? '└─ ' : '├─ '

      device.puts("#{prefix}#{connector}#{title}")

      child = node.children[title]
      child_prefix = prefix + (last ? '   ' : '│  ')

      print_branch(child, device, child_prefix)
    end

    tests.each_with_index do |title, index|
      last = contexts.length + index == entries - 1
      connector = last ? '└─ ' : '├─ '

      device.puts("#{prefix}#{connector}• #{title}")
    end
  end
end

sink = Tree::Sink.new

session = TestBench::Session.build
TestBench::Session.establish(session)
session.register_telemetry_sink(sink)

result = TestBench::Run.(
  'test/automated',
  session: session,
  exclude: '{_*,*/_*,*sketch*,*_init,*_tests}.rb'
)

root = sink.root
Tree.print(root, STDOUT)

exit(result ? 0 : 1)
