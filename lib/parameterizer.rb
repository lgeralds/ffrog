# 
#  parameterizer.rb
#  transcode
#  
#  Created by lgeralds on 2011-02-06.
#  Copyright 2011 lgeralds. All rights reserved.
# 

# Encapsulates the process of converting parameter, option pair into a string.

# Parameter methods are prefixed with "parameter" to distinguish them from
# other methods [allows method_missing() to catch parameter methods].

# This is the basic class. The actual methods are defined in external modules.

=begin
  TODO
  what to do with frame_size? Does caller need to know about changes
=end

require 'scaling'
require 'letterbox'
require 'aspect'
require 'watermark'

class Parameterizer
  include Scaling, Letterbox, Aspect, Watermark
  
  attr_accessor :frame_size
  
  def method_missing(name, *args)
    if name.to_s =~ /^parameter_/
      if self.class.method_defined?(name)
        self.send(name, args[0])
      else
        basic_parameter($', args[0])
      end
    else
      super
    end
  end
  
  def frame_size_split
    @frame_size.split(/x|X|\*/)
  end
  
  def parameterize(p, o=nil)
    return send("parameter_#{p}", o)
  end
  
  def basic_parameter(p, o)
    " -#{p}#{(!o.nil? and o != '') ? " #{o}": ''}"
  end
  
  def parameter_test_connivence(o)
    return ' -test_connivence hot tub'
  end
  
  # use resize in lieu of s. resize tracks frame size
  def parameter_resize(o)
      if o != nil and o != ''
        @frame_size = o
        " -s #{o}"
      end
  end
end


# if params.has_key?('vpre')
#   presets = params['vpre'].split(/,/)
# 
#   presets.each{ |preset|
#     if preset != nil and preset != ''
#       cmd += " -vpre #{preset}"
#     end
#   }
#   
#   params.delete('vpre')
