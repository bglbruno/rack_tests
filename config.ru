require 'rack_tests'

use Rack::Reloader, 0

run Rack::Cascade.new([Rack::File.new("public"), RackTests])
