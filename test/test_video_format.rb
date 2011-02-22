# 
#  test_video_format.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-10.
#  Copyright 2011 lgeralds. All rights reserved.
# 

require 'video_format.rb'

class TC_VideoFormatTest < Test::Unit::TestCase
  def setup
    @data = {:name => 'name', :ext => 'ext', :params => [{:one => 1}, {:two => 2}, {:three => 3}]}
    @data2 = {'name' => 'name2', 'ext' => 'ext2', 'params' => [{:one => 1}, {:two => 2}, {:three => 3}]}
    @vf = VideoFormat.new(@data)
  end
  
  def teardown
  end
  
  def test_name
    r = @vf.name
    assert( r == @data[:name], "Name failed[1]: #{r}")
  end
  
  def test_ext
    r = @vf.ext
    assert( r == @data[:ext], "Ext failed[1]: #{r}")
  end
  
  def test_params
    r = @vf.params
    assert( r == @data[:params], "Params failed[1]: #{r}")
  end
end
