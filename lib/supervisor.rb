# 
#  supervisor.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-18.
#  Copyright 2011 lgeralds. All rights reserved.
# 

require 'yaml'
require 'transcoder'
require 'configure_format'
require 'video_format'

class SupervisorException < StandardError
end

class Supervisor
  VERSION = '2.0.0'
  def initialize
    @overwrite = false
    @in = nil
    @out = nil
    @format = nil
    @conf = nil
    @watermark = nil
  end

  def version
    return "ffrog v#{Supervisor::VERSION} - transcoder v#{Transcoder::VERSION}"
  end

  def help
=begin
  TODO - add help
=end
    return "Help goes here"
  end

  def in=(f)
    required_filename_test(f, 'in')
    file_exist_test(f, 'in')
    @in = f
  end

  def format=(f)
    required_filename_test(f, 'format')
    file_exist_test(f, 'format')
    @format = f
  end

  def out=(f)
    if f
      optional_filename_test(f, 'out')

      if FileTest.exist? f and !@overwrite
        raise SupervisorException, "--out file exists"
      end
      @out = f
    end
  end

  def conf=(f)
    if f
      optional_filename_test(f, 'conf')
      file_exist_test(f, 'conf')
      @conf = f
    end
  end
  
  def watermark=(f)
    if f
      optional_filename_test(f, 'watermark')
      file_exist_test(f, 'watermark')
      @watermark = f
    end
  end
  
  def required_filename_test(f, text)
    if !f or f == ''
      raise SupervisorException, "--#{text} option required"
    end
  end

  def optional_filename_test(f, text)
    if f == ''
      raise SupervisorException, "--#{text} option requires a filename"
    end
  end

  def file_exist_test(f, text)
    if !FileTest.exist? f
      raise SupervisorException, "--#{text} file not found"
    end
  end
  
  def overwrite
    @overwrite = true
  end
  
  def execute
    fmt = YAML::load_file( @format )
    cnf = YAML::load_file( @conf )

    fmt.each do |format|
      Transcoder.new(ConfigureFormat.new(cnf), VideoFormat.new(format), @in, @out).transcode
    end
  end
end