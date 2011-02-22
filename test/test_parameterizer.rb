# 
#  parameterizer_test.rb
#  transcode
#  
#  Created by lgeralds on 2011-02-06.
#  Copyright 2011 lgeralds. All rights reserved.
# 

require 'parameterizer'
require '_test_scaling'
require '_test_letterbox'
require '_test_aspect'
require '_test_watermark'


class TC_ParameterizerTest < Test::Unit::TestCase
  include TestScaling, TestLetterbox, TestAspect, TestWatermark

  def setup
    @p = Parameterizer.new
    @size = '640x480'
    @p.frame_size = @size
  end
  
  def teardown
  end
  
  # test "silly shit" do
  #   puts "doing the silly shit here"
  # end
  
  def test_new
    assert( @p != nil, "New failed: #{@p}" )
  end
  
  # test architecture of class
  def test_basic_parameter
    r = @p.basic_parameter( 's', @size)
    assert( r == " -s #{@size}", "Basic parameter failed: #{r}")
  end

  def test_bad_method
    assert_raise(NoMethodError) { @p.bad_method }
  end

  def test_parameterize
    r = @p.parameterize( 's', @size)
    assert( r == " -s #{@size}", "Parameterize failed: #{r}")
  end

  def test_test_connivence
    r = @p.parameterize( 'test_connivence', 'warm bath')
    assert( r == " -test_connivence hot tub", "Test connivence failed: #{r}")
  end
  
  def test_frame_size
    r = @p.frame_size
    assert( r == @size, "Test frame size failed: #{r}")
  end

  def test_resize
    r = @p.parameterize(:resize, @size)
    assert( r == ' -s 640x480', "RESIZE[1] FAILED: #{r}")
    r = @p.parameter_resize(@size)
    assert( r == ' -s 640x480', "RESIZE[2] FAILED: #{r}")
  end
end
