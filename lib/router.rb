#!/usr/bin/env ruby
# Id$ nonnax 2022-03-01 15:28:55 +0800
class Route
  ROUTES = {
    "/" => :index
  }

  def initialize(env)
    if env["REQUEST_METHOD"] == "GET"
      @route_name = ROUTES[env["PATH_INFO"]] || "404"
    end
  end

  def route_name
    @route_name.to_s
  end
  def default
    "404"
  end
end
