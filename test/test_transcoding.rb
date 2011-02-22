#!/usr/bin/env ruby

# 
#  transcoding_test.rb
#  transcode
#  
#  Created by lgeralds on 2009-06-01.
#  Copyright 2009 lgeralds. All rights reserved.
# 

# This is meant to run quality tests on the transcoding process.
# Data is in transcoding_test.yaml

#require 'supervisor.rb'
require 'yaml'

class TC_TranscodingTest < Test::Unit::TestCase
  def test_true
    true
  end
#   class << self
#     def startup
# #      @yaml = YAML::load_file( 'transcoding_test.yaml' )
# #      @s = Supervisor.new(@yaml['conf'])
# #      # these are out of order for a reason
# #      @s.teardown
# #      @s.setup
# #      @c = @yaml['conf']
# #      `cp '#{@c['base_dir']}/#{@c['good_file']}' '#{@c['base_dir']}/#{@c['base_dir_in']}/#{@c['good_file']}'`
# #      `cp '#{@c['base_dir']}/test_04.mov' '#{@c['base_dir']}/#{@c['base_dir_in']}/test_04.mov'`
# #      `cp '#{@c['base_dir']}/test_01.mp4' '#{@c['base_dir']}/#{@c['base_dir_in']}/test_01.mp4'`
#     end
# 
#     def shutdown
#     end
# 
#     def suite
#       mysuite = super
#       def mysuite.run(*args)
#         TC_TranscodingTest.startup()
#         super
#         TC_TranscodingTest.shutdown()
#       end
#       mysuite
#     end
#   end
# 
# 
#   def setup
#     @yaml = YAML::load_file( 'transcoding_test.yaml' )
#     @t = Transcoder.new( @yaml['conf'], @yaml['conf']['good_file']  )
#   end
#   
#   def teardown
#   end
# 
#   def test_wmv
#     @t.format = @yaml['formats'][1]
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
# 
#   def test_mpg
#     @t.format = @yaml['formats'][2]
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
# 
#   def test_letterbox
#     @t.format = @yaml['formats'][3]
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
# 
#   def test_flash
#     @t.format = @yaml['formats'][4]
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
# 
#   def test_scale_by_width
#     @t.format = @yaml['formats'][5]
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
# 
#   def test_watermark
#     @t.format = @yaml['formats'][6]
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
# 
#   def test_watermark_custom_right
#     @t.format = @yaml['formats'][7]
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
# 
#   def test_watermark_custom_center
#     @t.format = @yaml['formats'][8]
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
# 
#   def test_watermark_custom_left
#     @t.format = @yaml['formats'][9]
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
# 
#   def test_low_res
#     @t.format = @yaml['formats'][10]
#     @t.file_in = @yaml['conf']['low-res_file']
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
# 
#   def test_sd_mp4
#     @t.format = @yaml['formats'][11]
#     @t.file_in = @yaml['conf']['good_file']
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
# 
#   def test_mp4
#     @t.format = @yaml['formats'][12]
#     @t.file_in = @yaml['conf']['good_file']
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
# 
#   def test_youtube
#     @t.format = @yaml['formats'][13]
#     @t.file_in = @yaml['conf']['good_file']
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
# 
#   def test_pillarbox
#     @t.format = @yaml['formats'][14]
#     @t.file_in = @yaml['conf']['sd_file']
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
# 
#   def test2_mp4
#     @t.format = @yaml['formats'][15]
#     @t.file_in = @yaml['conf']['good_file']
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
# 
#   def test_mov
#     @t.format = @yaml['formats'][16]
#     @t.file_in = @yaml['conf']['good_file']
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
# 
#   def test_aac
#     @t.format = @yaml['formats'][17]
#     @t.file_in = @yaml['conf']['good_file']
#     assert_nothing_raised() do
#       @t.transcode()
#       @t.close()
#     end
#   end
end
