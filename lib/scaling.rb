# 
#  scaling.rb
#  transcode
#  
#  Created by lgeralds on 2011-02-08.
#  Copyright 2011 lgeralds. All rights reserved.
# 

module Scaling
=begin
  TODO 
  These scale_by methods need to be combined somehow
=end
  def parameter_scale_by_width(o)
    if o != nil and o.to_i != 0
      f_sz = self.scale_by_width(frame_size_split, o.to_i)
      s = "#{f_sz[0]}x#{f_sz[1]}"
      @frame_size = s
      " -s #{s}"
    end
  end

  def parameter_scale_by_height(o)
    if o != nil and o.to_i != 0
      f_sz = self.scale_by_height(frame_size_split, o.to_i)
      s = "#{f_sz[0]}x#{f_sz[1]}"
      @frame_size = s
      " -s #{s}"
    end
  end

  def scale_by_width( frame_size, width )
    height = (frame_size[1].to_i * width.to_i / frame_size[0].to_i).to_i
    parity_check_scale(width, height)
  end

  def scale_by_height( frame_size, height )
    width = (frame_size[0].to_i * height.to_i / frame_size[1].to_i).to_i
    parity_check_scale(width, height)
  end

  def parity_check_scale(width, height)
    if width % 2 == 1
      width += 1
    end

    if height % 2 == 1
      height += 1
    end

    return [width, height]
  end
end