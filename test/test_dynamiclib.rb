# 
#  test_dynamiclib.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-15.
#  Copyright 2011 lgeralds. All rights reserved.
# 
require 'dynamiclib'

class TC_TestDynamicLib < Test::Unit::TestCase
  def setup
    @dl = DynamicLib.new
  end
  
  def test_new
    assert( @dl != nil, "New failed: #{@dl}" )
  end
  
  def test_ext
    r = DynamicLib.ext('darwin')
    assert( r == 'dylib', "Ext failed[darwin]: #{r}" )
    
    r = DynamicLib.ext('linux')
    assert( r == 'so', "Ext failed[linux]: #{r}" )
  end
end