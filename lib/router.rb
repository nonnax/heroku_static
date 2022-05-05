#!/usr/bin/env ruby
# frozen_string_literal: true

# Id$ nonnax 2022-03-01 15:28:55 +0800
class Router

  ROUTES = { '/' => 'Welcome!' }

  def self.fetch(env, default: nil)
    if env['REQUEST_METHOD'] == 'GET'
      status = 200
      name=ROUTES[env['PATH_INFO']]
      return { name:, status:} if name
    end
    { name: default, status: 404}
  end
end
