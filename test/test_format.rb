# 
#  test_format.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-18.
#  Copyright 2011 lgeralds. All rights reserved.
# 

require 'format'

class TC_FormatTest < Test::Unit::TestCase
  def setup
    @data = {:data => 'data'}
    @data2 = {'data' => 'data'}
    @f = Format.new(@data)
  end
  
  def teardown
  end
  
  def test_new
    assert( @f != nil, 'New failed' )
  end
  
  def test_initialize
    r = @f.__data
    assert( r == @data, "Data failed: #{r}" )
  end
  
  def test_generic_method
    r = @f.data
    assert( r == @data[:data], "Data failed[1]: #{r} " )
    
    @f = Format.new(@data2)
    r = @f.data
    assert( r == @data2['data'], "Data failed[2]: #{r}" )
  end
  
  def test_bad_method
    assert_raise(NoMethodError) { @f.bad_method }
  end
end
