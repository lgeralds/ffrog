# 
#  watermark.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-10.
#  Copyright 2011 lgeralds. All rights reserved.
# 

# How should this work?
# Info needed:
# what image to use, image size, wm position
# *** this stuff should be computed and set up stream ****

# wm_lib
# wm_ffmpeg 0,1 [avfilter or not]
# wm_margin
# wm_horz left, center, right or number [a == a.to_i.to_s <= is_numeric?]
# wm_vert top, center, bottom or number
# wm_file
# wm_size


module Watermark
  def parameter_watermark(p)
    p = p.split(',')
    pp = {}
    
    p.each do |i|
      j = i.split('=')
      pp[j[0]] = j[1]
    end

    if !pp.has_key? 'wm_margin'
      pp['wm_margin'] = '0x0'
    end
    
    w_pos = place_watermark( @frame_size, pp['wm_size'], pp['wm_horz'], pp['wm_vert'], pp['wm_margin'] ).split(/x|X|\*/)
    
    if pp['wm_ffmpeg'] == '1'
      # " -vf 'movie=0:png:#{pp['wm_file']} [wm];[in][wm] overlay=#{w_pos[0]}:#{w_pos[1]} [out]'"
      " -vf 'movie=0:png:#{pp['wm_file']} [wm];[in][wm] overlay=#{w_pos[0]}:#{w_pos[1]} [out]'"
    else
      " -vhook '#{pp['wm_lib']} -x #{w_pos[0]} -y #{w_pos[1]} -i #{pp['wm_file']}'"
    end
  end

  def place_watermark( frame_size, watermark_size, horz, vert, margin='0x0' )
    margin = margin.split(/x|X|\*/)
    w_sz = watermark_size.split(/x|X|\*/)
    f_sz = frame_size.split(/x|X|\*/)

    if horz == horz.to_i.to_s# <= is numeric?
      left = horz
    else
      case horz.downcase
        when 'center'
          left = ((f_sz[0].to_i - w_sz[0].to_i) / 2).to_i
        when 'left'
          left = margin[0].to_i
        else # default to right
          left = f_sz[0].to_i - w_sz[0].to_i - margin[0].to_i
      end
    end

    if vert == vert.to_i.to_s# <= is numeric?
      top = vert
    else
      case vert.downcase
        when 'center'
          top = ((f_sz[1].to_i - w_sz[1].to_i) / 2).to_i
        when 'top'
          top = margin[1].to_i
        else # default to bottom
          top = f_sz[1].to_i - w_sz[1].to_i - margin[1].to_i
      end
    end
    
    return "#{left}x#{top}"
  end
end
