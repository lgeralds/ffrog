# 
#  ffprobe.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-15.
#  Copyright 2011 lgeralds. All rights reserved.
# 

require 'executive'

class FFProbe
  include Executive
  
  def initialize( ffprobe, filename )
    @ffprobe = ffprobe
    @filename = filename
    @data = { :streams => []}
    parse
  end
  
  def data
    @sdata
  end
  
  def video
    @svideo
  end
  
  def audio
    @saudio
  end
  
  def parse
    cmd = "#{@ffprobe} -show_streams -show_format #{@filename}"
    stream = {}
    f = false
    s = false

    exe(cmd).each do |l|
      if l =~ /^\[FORMAT\]/
        f = true
        next
      end

      if l=~ /^\[\/FORMAT\]/
        f = false
        next
      end

      if l =~ /\[STREAM\]/
        s = true
        stream = {}
        next
      end

      if l=~ /\[\/STREAM\]/
        s = false
        @data[:streams][stream['index'].to_i] = stream
        next
      end

      if f
        m = l.split('=')
        @data[m[0]] = m[1].strip
      end

      if s
        m = l.split('=')
        stream[m[0]] = m[1].strip
      end
    end
    
    @data[:streams].each do |s|
      case s['codec_type']
      when 'video'
        @svideo = s
      when 'audio'
        @saudio = s
      when 'data'
        @sdata = s
      end
    end
  end
end
