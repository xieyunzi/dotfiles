#!/usr/bin/env ruby

require 'optparse'

opts = { :panes => :visible }
op = OptionParser.new do |o|
  o.banner = "usage: #{$0} [OPTIONS]"
  o.separator ''
  o.on('-A', '--all', 'All panes')              { |v| opts[:panes] = :all }
  o.on('-a', '--all-but-current',
       'All panes but the active one')          { |v| opts[:panes] = :others }
  o.on('-s NUM', '--scroll NUM', 'Scroll back') { |v| opts[:scroll] = v }
  o.on('-p STR', '--prefix STR', 'Prefix')      { |v| opts[:prefix] = v }
  o.on('-m NUM', '--min NUM', 'Minimum length') { |v| opts[:min] = v.to_i }
  o.separator ''
  o.on('-h', '--help', 'Show this message')     { puts o; exit }
  o.separator ''
end

begin
  op.parse!
rescue OptionParser::InvalidOption => x
  $stderr.puts x
  $stderr.puts op
  exit 1
end

puts opts
