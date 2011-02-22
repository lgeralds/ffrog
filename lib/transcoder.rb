# 
#  transcoder.rb
#  transcode
#  
#  Created by lgeralds on 2009-06-01.
#  Copyright 2009 lgeralds. All rights reserved.
# 

=begin
  TODO 
  eliminate the supervisor?
  move the transcoder testing to functional_test.rb
  move transcoder tests from supervisor_tests to transcoder_tests
=end

require 'fileutils'
require 'executive'
require 'parameterizer'
require 'ffprobe'
require 'dynamiclib'

class Transcoder
  include Executive
  VERSION = '2.0.0'

  # accessors are used durning testing
  attr_accessor :conf, :video_format, :file_in, :file_out, :os
  # video_format accessor - needs to deal with VideoFormat types
  
  def initialize( conf, video_format, file_in, file_out='' )
    @conf = conf
    @video_format = video_format
    @file_in = file_in
    @file_out = file_out
    @frame_size = ''
    @orig_frame_size = ''
    @ffmpeg_ver = 0
    @os = ''

    exe("#{@conf.ffmpeg} -version").each do |r|
      if r =~ /libavfilter/
        @ffmpeg_ver = 1
        break
      end
    end
    
    @os = exe("uname")[0].strip.downcase

    # puts "VERSION: #{@ffmpeg_ver}"
    # puts "OS: #{@os}"
  end
  
  def close
    frame = File.basename( @file_in ).gsub( /\./, '-' )
    f_name_w = "#{frame}-*.png"
    f_name_a = "#{frame}-1.png"

    if FileTest.exist?( f_name_a )
      self.exe( "rm -f #{f_name_w}" )
    end
  end
  
  def rm_file_out
    f_name = "#{self.file_out}"
    
    if FileTest.exist?( f_name )
      FileUtils.rm_r( f_name )
    end
  end
  
  def transcode
    if @file_out != nil and @file_out != ''
      file_out = @file_out
    else
      file_out = File.basename( @file_in, File.extname( @file_in ) )

      if @video_format.ext && @video_format.ext != ''
        file_out += '.' + @video_format.ext
      end
    end
    
    exe( "#{@conf.ffmpeg} -y -i '#{@file_in}'#{self.build_param_list} '#{file_out}'" )
  end
  
  def expand_macro(k, v)
    if !v
      v =''
    end
    
    if k == 'watermark'
      if @ffmpeg_ver == 1
        ffp = FFProbe.new( "#{@conf.ffprobe}", @conf.wm_file )
        wm_size = [ffp.video['width'], ffp.video['height']]
      else
        wm_size = exe( "identify '#{ @conf.wm_file}'" ).to_s.split(' ')[2]
      end
      v = "wm_ffmpeg=#{@ffmpeg_ver},wm_lib=#{DynamicLib.ext(@os)},wm_file=#{@conf.wm_file},wm_size=#{wm_size[0]}x#{wm_size[1]},wm_margin=#{@conf.wm_margin},wm_horz=right,wm_vert=bottom" + (v != 0? ',':'') + v
    end
    v
  end
  
  def build_param_list
    p = Parameterizer.new
    p.frame_size = frame_size
    cmd = ''

    begin
      @video_format.params.each
    rescue
      # puts "NO VIDEO PARAMETERS. #{@video_format.name}\n#{$!}"
    else
      @video_format.params.each { |i|
        i.each { |key, value|
          cmd += p.send( "parameter_#{key}", expand_macro(key, value) )
        }
      }
    end

    cmd
  end

  def frame_grab
    if @ffmpeg_ver == 1
      ffp = FFProbe.new( "#{@conf.ffprobe}", @file_in )
      "#{ffp.video['width']}x#{ffp.video['height']}"
    else
      frame = File.basename( @file_in ).gsub( /\.| /, '-' )

      if !FileTest.exist?( "#{frame}-1.png" )
        exe( "#{@conf.ffmpeg} -y -i '#{@file_in}' -an -ss 00:00:03 -t 00:00:01 -r 1 '#{frame}-%d.png'"  )
      end

      exe( "identify '#{frame}-1.png'" ).to_s.split(' ')[2]
    end
  end

  def orig_frame_size
    if @orig_frame_size == ''
      @orig_frame_size = frame_grab
    end

    return @orig_frame_size
  end
  
  def frame_size
    if @frame_size == ''
      @orig_frame_size = @frame_size = frame_grab
    end
    
    return @frame_size
  end
end
