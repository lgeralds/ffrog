# 
#  letterbox.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-10.
#  Copyright 2011 lgeralds. All rights reserved.
# 

module Letterbox
  def parameter_letterbox(p)
    " " + self.build_letterbox(p.split( /:/ ))
  end

  def build_letterbox( aspect=[4,3] )
    # NOTE: padding sizes are in terms of the output video
    f_sz = frame_size_split
    letterbox = ''
    
    needed_height = (f_sz[0].to_i * aspect[1].to_i / aspect[0].to_i).to_i
  
    if needed_height > 2
      needed_padding_t = needed_padding_b = (( needed_height - f_sz[1].to_i ) / 2).to_i
    
      if needed_padding_t % 2 == 1
        needed_padding_t += 1
        needed_padding_b -= 1
      end
    
      height = f_sz[1].to_i + needed_padding_t + needed_padding_b
      self.frame_size = "#{f_sz[0]}x#{height}"
    
      letterbox = "-padtop #{needed_padding_t} -padbottom #{needed_padding_b}"
    end
    
    letterbox
  end

  def parameter_pillarbox(p)
    " " + build_pillarbox( p.split( /:/ ) )
  end

  def build_pillarbox( aspect )
    # NOTE: padding sizes are in terms of the output video
    f_sz = frame_size_split
    pillarbox = ''
  
    needed_width = (f_sz[1].to_i * aspect[0].to_i / aspect[1].to_i).to_i
  
    if needed_width > 2
      needed_padding_l = needed_padding_r = (( needed_width - f_sz[0].to_i ) / 2).to_i
    
      if needed_padding_l % 2 == 1
        needed_padding_l += 1
        needed_padding_r -= 1
      end
    
      width = f_sz[0].to_i + needed_padding_l + needed_padding_r
      self.frame_size = "#{width}x#{f_sz[1]}"
    
      pillarbox = "-padleft #{needed_padding_l} -padright #{needed_padding_r}"
    end
    
    pillarbox
  end
end