# 
#  test_ffprobe.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-15.
#  Copyright 2011 lgeralds. All rights reserved.
# 

require 'ffprobe'


class TC_FFProbeTest < Test::Unit::TestCase
  def setup
    @yaml = YAML::load_file( 'test/data/test_conf_supervisor.yaml' )
    @ffprobe = @yaml['base_dir'] + @yaml['bin_dir'] + @yaml['ffprobe']
    @ffp = false
    
    if FileTest.exists? @ffprobe
      @ffp = FFProbe.new( @ffprobe, @yaml['good_file'] )
    end
  end

  def test_new
    if @ffp
      assert( @ffp != nil, 'New failed' )
    end
  end
  
  def test_results
    if @ffp
      r = @ffp.video['width']
      assert( r == '720', "PARSE RESULTS FAILED[width]: #{r}")

      r = @ffp.video['height']
      assert( r == '480', "PARSE RESULTS FAILED[height]: #{r}")
    end
  end
  
  def test_image_size
    if @ffp
      ffp = FFProbe.new( @fffprobe, @yaml['conf']['watermark_file'] )

      r = ffp.video['width']
      assert( r == '374', "WATERMARK FAILED[width]: #{r}")

      r = ffp.video['height']
      assert( r == '51', "WATERMARK FAILED[height]: #{r}")
    end
  end
end



# [STREAM]
# index=0
# codec_name=svq3
# codec_long_name=Sorenson Vector Quantizer 3 / Sorenson Video 3 / SVQ3
# codec_type=video
# codec_time_base=1/30000
# codec_tag_string=SVQ3
# codec_tag=0x33515653
# width=720
# height=480
# has_b_frames=0
# pix_fmt=yuvj420p
# r_frame_rate=30000/1001
# avg_frame_rate=30000/1001
# time_base=1/30000
# start_time=0.000000 
# duration=10.176833 
# nb_frames=305
# TAG:creation_time=2011-02-15 01:25:09
# TAG:language=eng
# [/STREAM]
# [STREAM]
# index=1
# codec_name=pcm_s16be
# codec_long_name=PCM signed 16-bit big-endian
# codec_type=audio
# codec_time_base=0/1
# codec_tag_string=twos
# codec_tag=0x736f7774
# sample_rate=44100.000000 
# channels=1
# bits_per_sample=16
# r_frame_rate=0/0
# avg_frame_rate=31643/719
# time_base=1/44100
# start_time=0.000000 
# duration=10.176848 
# nb_frames=448799
# TAG:creation_time=2011-02-15 01:25:09
# TAG:language=eng
# [/STREAM]
# [STREAM]
# index=2
# codec_name=unknown
# codec_type=data
# codec_time_base=0/1
# codec_tag_string=[0][0][0][0]
# codec_tag=0x0000
# r_frame_rate=0/0
# avg_frame_rate=0/0
# time_base=1/30000
# start_time=0.000000 
# duration=10.176833 
# TAG:creation_time=2011-02-15 01:25:09
# TAG:language=eng
# [/STREAM]
# [FORMAT]
# filename=data/short_sample.mov
# nb_streams=3
# format_name=mov,mp4,m4a,3gp,3g2,mj2
# format_long_name=QuickTime/MPEG-4/Motion JPEG 2000 format
# start_time=0.000000 
# duration=10.176848 
# size=17962974.000000 
# bit_rate=14120658.000000 
# TAG:major_brand=qt  
# TAG:minor_version=537199360
# TAG:compatible_brands=qt  
# TAG:creation_time=2011-02-15 01:25:09
# [/FORMAT]
