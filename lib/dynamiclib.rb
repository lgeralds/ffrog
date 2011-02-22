# 
#  dynamiclib.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-15.
#  Copyright 2011 lgeralds. All rights reserved.
# 

class DynamicLib
  def self.ext(os)
    case os
    when 'darwin'
      'dylib'
    when 'linux'
      'so'
    else
      'unknown'
    end
  end
end

