# 
#  test_transcoder.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-15.
#  Copyright 2011 lgeralds. All rights reserved.
# 

require 'transcoder'
require 'configure_format'
require 'video_format'

class TC_TestTranscoder < Test::Unit::TestCase
  def setup
    @fmt = YAML::load_file( 'test/data/test_format_supervisor.yaml' )
    @cnf = YAML::load_file( 'test/data/test_conf_supervisor.yaml' )
    @t = Transcoder.new(ConfigureFormat.new(@cnf), VideoFormat.new(@fmt[0]), nil, nil)
    @t.file_in = @cnf['good_file']
  end
  
  def test_new
    assert( @t != nil, "New failed: #{@t}" )
  end

  def test_frame_grab
    assert_nothing_thrown() do
      @t.frame_grab
      @t.close()
    end
    
    r = @t.frame_grab
    assert( r == '720x480', "FRAME GRAB failed: #{r}" )
  end
  
  def test_frame_size
    size = nil

    assert_nothing_thrown() do
      size = @t.frame_size
      @t.close()
    end
    
    assert( size.kind_of?( String ), "BAD TYPE" )
    assert( size.split( /x|X|\*/ ), "BAD FORMAT" )
  end

  def test_build_param_list
    r = @t.build_param_list
    assert( r == ' -k 1 -l 2 -m 3 -n -o 4 -p -q 5', "BUILD PARAM LIST failed: |#{r}|" )

    @t.video_format = VideoFormat.new(@fmt[1])
    r = @t.build_param_list
    assert( r == '', "BUILD PARAM LIST failed [missing]: #{r}" )

    @t.video_format = VideoFormat.new(@fmt[2])
    r = @t.build_param_list
    assert( r == '', "BUILD PARAM LIST failed [empty]: #{r}" )

    @t.video_format = VideoFormat.new(@fmt[5])
    r = @t.build_param_list
    assert( r =~ /-vhook/, "BUILD PARAM LIST failed [vhook]: #{r}" )

    @cnf = YAML::load_file( 'test/data/test_conf_supervisor_2.yaml' )
    @t = Transcoder.new(ConfigureFormat.new(@cnf), VideoFormat.new(@fmt[5]), nil, nil)
    @t.file_in = @cnf['good_file']
    r = @t.build_param_list
    assert( r =~ /-vf/, "BUILD PARAM LIST failed [vf]: #{r}" )
  end
end
