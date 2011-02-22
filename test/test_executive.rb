# 
#  executive_text.rb
#  transcode
#  
#  Created by lgeralds on 2011-02-06.
#  Copyright 2011 lgeralds. All rights reserved.
# 

require 'executive.rb'

class TC_ExecutiveTest < Test::Unit::TestCase
  include Executive
  
  def setup
  end
  
  def teardown
  end
  
  def test_commands
    # test good command
    assert_nothing_thrown() do
      exe('ls')
    end

    # test bad param
    assert_raise(ExecutionException) do
      exe('ls --bad_param')
    end

    # test bad command
    assert_raise(ExecutionException) do
      exe('not_a_really_command')
    end
  end
end
