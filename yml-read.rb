#!/usr/bin/env ruby

require 'yaml'

yaml = YAML::load_file( 'test.yaml' )

puts "#{yaml['formats'][0]['params'][3]}"

wm = yaml['formats'][0]['params'][3]
puts wm.class
puts wm['wm_file']
puts wm['wm_pos']
puts wm['wm_size']