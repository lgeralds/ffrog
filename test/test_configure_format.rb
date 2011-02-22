# 
#  test_configure_format.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-18.
#  Copyright 2011 lgeralds. All rights reserved.
# 

# yaml class returns hash with string keys

require 'configure_format.rb'

class TC_ConfigureFormatTest < Test::Unit::TestCase
  def setup
    @data = {
      'base_dir' => '/Users/lgeralds/Projects/general-installer/ffmpeg-avfilter',
      'lib_dir' => '/lib/vhook',
      'bin_dir' => '/bin',
      'ffmpeg' => '/ffmpeg',
      'ffprobe' => '/ffprobe',
      'wm_lib' => 'imlib2',
      'wm_file' => 'watermark_test.png',
      'wm_margin' => '16x16'
    }

    @cf = ConfigureFormat.new(@data)
  end


  def test_lib_dir
    r = @cf.lib_dir
    assert( r == @data['base_dir'] + @data['lib_dir'], "lib_dir failed: #{r}")
  end
  
  def test_bin_dir
    r = @cf.bin_dir
    assert( r == @data['base_dir'] + @data['bin_dir'], "bin_dir failed: #{r}")
  end

  def test_ffmpeg
    r = @cf.ffmpeg
    assert( r == @data['base_dir'] + @data['bin_dir'] + @data['ffmpeg'], "ffmpeg failed: #{r}")
  end

  def test_ffprobe
    r = @cf.ffprobe
    assert( r == @data['base_dir'] + @data['bin_dir'] + @data['ffprobe'], "ffprobe failed: #{r}")
  end

  def test_wm_lib
    r = @cf.wm_lib
    assert( r == @data['base_dir'] + @data['lib_dir'] + @data['wm_lib'], "wm_lib failed: #{r}")
  end
end