# 
#  _test_watermark.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-10.
#  Copyright 2011 lgeralds. All rights reserved.
# 

require 'dynamiclib'

module TestWatermark
  
  def test_place_watermark
    #def place_watermark( frame_size, watermark_size, horz, vert )

    r = @p.place_watermark( '99x99', '33x33', 'left', 'top' )
    assert( r == '0x0', "WATERMARK PLACEMENT failed [01]: #{r}" )

    r = @p.place_watermark( '99x99', '33x33', 'center', 'top' )
    assert( r == '33x0', "WATERMARK PLACEMENT failed [02]: #{r}" )

    r = @p.place_watermark( '99x99', '33x33', 'right', 'top' )
    assert( r == '66x0', "WATERMARK PLACEMENT failed [03]: #{r}" )

    r = @p.place_watermark( '99x99', '33x33', 'left', 'center' )
    assert( r == '0x33', "WATERMARK PLACEMENT failed [04]: #{r}" )

    r = @p.place_watermark( '99x99', '33x33', 'center', 'center' )
    assert( r == '33x33', "WATERMARK PLACEMENT failed [05]: #{r}" )

    r = @p.place_watermark( '99x99', '33x33', 'right', 'center' )
    assert( r == '66x33', "WATERMARK PLACEMENT failed [06]: #{r}" )

    r = @p.place_watermark( '99x99', '33x33', 'left', 'bottom' )
    assert( r == '0x66', "WATERMARK PLACEMENT failed [07]: #{r}" )

    r = @p.place_watermark( '99x99', '33x33', 'center', 'bottom' )
    assert( r == '33x66', "WATERMARK PLACEMENT failed [08]: #{r}" )

    r = @p.place_watermark( '99x99', '33x33', 'right', 'bottom' )
    assert( r == '66x66', "WATERMARK PLACEMENT failed [09]: #{r}" )

    # w/margins
    r = @p.place_watermark( '99x99', '33x33', 'left', 'top', '10x20' )
    assert( r == '10x20', "WATERMARK PLACEMENT failed [11]: #{r}" )

    r = @p.place_watermark( '99x99', '33x33', 'center', 'top', '10x20' )
    assert( r == '33x20', "WATERMARK PLACEMENT failed [12]: #{r}" )

    r = @p.place_watermark( '99x99', '33x33', 'right', 'top', '10x20' )
    assert( r == '56x20', "WATERMARK PLACEMENT failed [13]: #{r}" )

    r = @p.place_watermark( '99x99', '33x33', 'left', 'center', '10x20' )
    assert( r == '10x33', "WATERMARK PLACEMENT failed [14]: #{r}" )

    r = @p.place_watermark( '99x99', '33x33', 'center', 'center', '10x20' )
    assert( r == '33x33', "WATERMARK PLACEMENT failed [15]: #{r}" )

    r = @p.place_watermark( '99x99', '33x33', 'right', 'center', '10x20' )
    assert( r == '56x33', "WATERMARK PLACEMENT failed [16]: #{r}" )

    r = @p.place_watermark( '99x99', '33x33', 'left', 'bottom', '10x20' )
    assert( r == '10x46', "WATERMARK PLACEMENT failed [17]: #{r}" )

    r = @p.place_watermark( '99x99', '33x33', 'center', 'bottom', '10x20' )
    assert( r == '33x46', "WATERMARK PLACEMENT failed [18]: #{r}" )

    r = @p.place_watermark( '99x99', '33x33', 'right', 'bottom', '10x20' )
    assert( r == '56x46', "WATERMARK PLACEMENT failed [19]: #{r}" )

    # test numeric
    r = @p.place_watermark( '99x99', '33x33', '25', '25' )
    assert( r == '25x25', "WATERMARK PLACEMENT failed [21]: #{r}" )

    # test numeric w/margin
    r = @p.place_watermark( '99x99', '33x33', '25', '25', '10x20' )
    assert( r == '25x25', "WATERMARK PLACEMENT failed [22]: #{r}" )
  end

  def test_watermark
    wm_lib = 'watermark_lib.dylib'
    wm_file = 'watermark_file.png'
    wm_horz = '25'
    wm_vert = '25'
    wm_size = '33x33'

    p = 
      "wm_size=#{wm_size}," +
      "wm_lib=#{wm_lib}," +
      "wm_horz=#{wm_horz}," +
      "wm_vert=#{wm_vert}," +
      "wm_file=#{wm_file}," +
      ""
    
    @p.frame_size = '99x99'
    
    r = @p.parameterize(:watermark, p + 'wm_ffmpeg=0')
    assert( r == " -vhook '#{wm_lib} -x #{wm_horz} -y #{wm_vert} -i #{wm_file}'", "WATERMARK VHOOK FAILED: |#{r}|" )

    r = @p.parameter_watermark(p + 'wm_ffmpeg=1')
    assert( r == " -vf 'movie=0:png:#{wm_file} [wm];[in][wm] overlay=#{wm_horz}:#{wm_vert} [out]'", "WATERMARK VF FAILED: |#{r}|" )
  end

  def xtest_watermark
    wm_lib = 'watermark_lib'
    wm_file = 'watermark_file'
    wm_pos = 'right'
    wm_size = '64x32'
    
    p = 
      "wm_lib=#{wm_lib}," + 
      "wm_ffmpeg=0," +
      "wm_margin=16," +
      "wm_horz=center," +
      "wm_vert=center," +
      "wm_file=#{wm_file}," +
      "wm_siz=#{wm_size}"
    
    r = @p.parameterize(:watermark, p )
    assert( r == " -vhook '#{wm_lib} -x 566 -y 400 -i #{wm_file}'", "WATERMARK FAILED: #{r}" )
  end
end