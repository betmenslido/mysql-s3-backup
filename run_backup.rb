#!/usr/bin/env ruby

require "bundler"
Bundler.setup(:default).require(:default)

$:.unshift File.expand_path("./lib", __dir__)

puts "Backup starting..."
