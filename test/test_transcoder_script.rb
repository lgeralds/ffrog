#!/usr/bin/env ruby

# 
#  supervisor_test.rb
#  transcode
#  
#  Created by lgeralds on 2009-06-01.
#  Copyright 2009 lgeralds. All rights reserved.
# 

# This will run unit tests on the Supervisor class and the transcoder script
# Data is in supervisor_test.yaml
#

# Base test video is test/data/black-720x480.mp4 [720x480]

# require 'supervisor.rb'
# require 'yaml'

class TC_SupervisorTest < Test::Unit::TestCase
  def test_true
    true
  end
#   def setup
#     @yaml = YAML::load_file( 'supervisor_test.yaml' )
#     @s = Supervisor.new(@yaml['conf'])
#   end
#   
#   def teardown
#   end
#   
#   def test_new
#     assert( @s != nil, 'New failed' )
#     assert( @s.conf == @yaml['conf'], 'Conf not same.' )
#   end
#   
#   def test_setup
#     @s.setup
#   end
#   
#   def test_teardown
# #    @s.teardown
#   end
end

class TC_TranscoderTest < Test::Unit::TestCase
  def test_true
    true
  end
#   def setup
#     @yaml = YAML::load_file( 'supervisor_test.yaml' )
#     @t = Transcoder.new( @yaml['conf'], '' )
#     @t.format = @yaml['formats'][0]
#     @c = @yaml['conf']
#   end
#   
#   def teardown
#   end
#   
#   def test_new
#     assert( @t != nil , 'New failed' )
#     assert( @t.conf == @yaml['conf'], 'Conf not same.' )
#     assert( @t.format == @yaml['formats'][0], 'Format not same.' )
#   end
#   
#   
# 
# 
#   def skip_test_transcode
#     @t.format = @yaml['formats'][2]
#     
#     e = assert_raise(ExecutionException) {
#       @t.file_out = 'junk'
#       @t.transcode()
#       @t.close()
#     }
#     
# #    print "ERROR:\n#{e.message}\n"
# 
#     @t.file_in = @c['good_file']
#     assert_nothing_thrown() do
#       @t.file_out = 'good.flv'
#       @t.transcode()
#       @t.close()
#     end
#   end
end
