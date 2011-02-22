# 
#  _test_scaling.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-10.
#  Copyright 2011 lgeralds. All rights reserved.
# 


module TestScaling
  def test_scale_by_width
    r = @p.scale_by_width( [640, 480], 320 )
    assert( r == [320, 240], "WIDTH SCALE fail[1]: #{r}" )
    r = @p.scale_by_width( [320, 240], 640 )
    assert( r == [640, 480], "WIDTH SCALE fail[2]: #{r}" )

    r = @p.parameterize(:scale_by_width, 320)
    assert( r == ' -s 320x240', "WIDTH SCALE fail[3]: #{r}" )
    r = @p.parameter_scale_by_width(320)
    assert( r == ' -s 320x240', "WIDTH SCALE fail[4]: #{r}" )
  end

  def test_scale_by_height
    r = @p.scale_by_height( [640, 480], 240 )
    assert( r == [320, 240], "HEIGHT SCALE fail[1] #{r}" )
    r = @p.scale_by_height( [320, 240], 480 )
    assert( r == [640, 480], "HEIGHT SCALE fail[2] #{r}" )

    r = @p.parameterize(:scale_by_height, 240)
    assert( r == ' -s 320x240', "HEIGHT SCALE fail[3]: #{r}" )
    r = @p.parameter_scale_by_height(240)
    assert( r == ' -s 320x240', "HEIGHT SCALE fail[4]: #{r}" )
  end
end