#!/usr/bin/env ruby
# vim:set ft=ruby

require_relative 'lib/setup.rb'

s = Setup.configure do |v|
  v.debug = false
  v.src_dir = "./files"

  v.ignore(/.*\/cache($|\/)/)
  v.ignore(/.\.zwc$/)
end

s.run
