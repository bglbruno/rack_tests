require "erb"

class RackTests
  
  def self.call(env)  
    new(env).response.finish
  end
  
  def initialize(env)
    @request = Rack::Request.new(env)
  end

  def response
    case @request.path
    when "/" then Rack::Response.new(render("index.html.erb"))
    else Rack::Response.new(render("not_found.html.erb"))
    end
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

end
