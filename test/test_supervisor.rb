# 
#  test_supervisor.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-18.
#  Copyright 2011 lgeralds. All rights reserved.
# 

require 'Supervisor'

class TC_SupervisorTest < Test::Unit::TestCase
  def setup
    @s = Supervisor.new()
  end
  
  def teardown
  end
  
  def test_new
    assert( @s != nil, 'New failed' )
  end
  
  def test_initialize
  end

  def test_version
    assert( @s.version, "Version failed." )
  end

  def test_help
    assert( @s.help, "Help failed." )
  end

  def test_in
    assert_raise SupervisorException do
      @s.in = nil
    end

    assert_raise SupervisorException do
      @s.in = ''
    end
    
    assert_raise SupervisorException do
      @s.in = 'this_file_doesnt_exist'
    end
    
    assert_nothing_raised do
      @s.in = 'test/data/test_sample.mov'
    end
  end

  def test_format
    assert_raise SupervisorException do
      @s.format = nil
    end

    assert_raise SupervisorException do
      @s.format = ''
    end
    
    assert_raise SupervisorException do
      @s.format = 'this_file_doesnt_exist'
    end
    
    assert_nothing_raised do
      @s.format = 'test/data/test_sample.mov'
    end
  end

  def test_out
    assert_raise SupervisorException do
      @s.out = ''
    end
    
    assert_nothing_raised do
      @s.out = 'this_file_doesnt_exist'
    end
    
    assert_raise SupervisorException do
      @s.out = 'test/data/test_sample.mov'
    end

    assert_nothing_raised do
      @s.overwrite
      @s.out = 'test/data/test_sample.mov'
    end
  end
  
  def test_conf
    assert_raise SupervisorException do
      @s.conf = ''
    end
    
    assert_raise SupervisorException do
      @s.conf = 'this_file_doesnt_exist'
    end
    
    assert_nothing_raised do
      @s.conf = 'test/data/test_sample.mov'
    end
  end
  
  def test_watermark
    assert_raise SupervisorException do
      @s.watermark = ''
    end
    
    assert_raise SupervisorException do
      @s.watermark = 'this_file_doest_exist'
    end

    assert_nothing_raised do
      @s.watermark = 'test/data/test_sample.mov'
    end
  end

  def test_overwrite
    @s.overwrite
  end
end