#!/usr/bin/env ruby
# frozen_string_literal: true

# Id$ nonnax 2022-03-01 15:27:49 +0800
require 'erb'
class View
  attr :layout, :template
  def self.erb(page, **data)
    new(page, **data).erb
  end

  def initialize(page, **data)
    @data = data

    l, t = [:layout, page].map do |f|
      File.join(File.dirname(__FILE__), "../public/views/#{f}.erb")
    end

    @template = File.read(t) rescue page
    @layout   = File.read(l) rescue '<%=yield%>'
  end

  def erb
      _render(@layout) { _render(@template, binding) }
  end

  def _render(f, b=binding)
    ERB.new(f).result(b)
  end
end
