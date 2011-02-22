# 
#  _test_aspect.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-10.
#  Copyright 2011 lgeralds. All rights reserved.
# 

module TestAspect
  def test_aspect
    r = @p.parameterize(:aspect)
    assert( r == ' -aspect 4:3', "ASPECT FAILED[1]: #{r}")

    r = @p.parameter_aspect
    assert( r == ' -aspect 4:3', "ASPECT FAILED[2]: #{r}")

    @p.frame_size = '960x640'
    r = @p.parameter_aspect
    assert( r == ' -aspect 9:6', "ASPECT FAILED[3]: #{r}")

    @p.frame_size = '640x360'
    r = @p.parameter_aspect
    assert( r == ' -aspect 16:9', "ASPECT FAILED[4]: #{r}")
  end
end