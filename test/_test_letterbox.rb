# 
#  _test_letterbox.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-10.
#  Copyright 2011 lgeralds. All rights reserved.
# 

module TestLetterbox
  def test_letterbox
    r = @p.parameterize(:letterbox, '1:1')
    assert( r == ' -padtop 80 -padbottom 80', "LETTERBOX FAILED[1]: #{r}")

    @p.frame_size = '640x480'
    r = @p.parameter_letterbox('1:1')
    assert( r == ' -padtop 80 -padbottom 80', "LETTERBOX FAILED[2]: #{r}")
  end

  def test_pillarbox
    r = @p.parameterize(:pillarbox, '16:9')
    assert( r == ' -padleft 106 -padright 106', "PILLARBOX FAILED[1]: #{r}")

    @p.frame_size = '640x480'
    r = @p.parameter_pillarbox('16:9')
    assert( r == ' -padleft 106 -padright 106', "PILLARBOX FAILED[2]: #{r}")
  end
end