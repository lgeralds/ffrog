# 
#  configure_format.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-18.
#  Copyright 2011 lgeralds. All rights reserved.
# 

require 'format'

class ConfigureFormat < Format
  def lib_dir
    base_dir + @__data['lib_dir']
  end

  def bin_dir
    base_dir + @__data['bin_dir']
  end

  def ffmpeg
    bin_dir + @__data['ffmpeg']
  end

  def ffprobe
    bin_dir + @__data['ffprobe']
  end

  def wm_lib
    lib_dir + @__data['wm_lib']
  end
end
