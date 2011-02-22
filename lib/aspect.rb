# 
#  aspect.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-10.
#  Copyright 2011 lgeralds. All rights reserved.
# 

module Aspect
  def parameter_aspect(*o)
    " -aspect " + aspect_ratio
  end

  def aspect_ratio
    aspect = ''

    case aspect_ratio_n
      when 1.3, 1.4
        aspect = '4:3'
      when 1.5, 1.6
        aspect = '9:6'
      when 1.7, 1.8
        aspect = '16:9'
    end
    
    aspect
  end

  def aspect_ratio_n
    f_sz = frame_size_split
    (( f_sz[0].to_i * 100 / f_sz[1].to_i ).to_i / 10.0).round / 10.0
  end
end