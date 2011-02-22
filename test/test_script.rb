


require 'executive'

class TC_ScriptTest < Test::Unit::TestCase
  include Executive

  def setup
  end

  # def test_true
  #   true
  # end

  def test_no_options
    assert_raise ExecutionException do
      exe( "bin/transcoder" )
    end
  end

  def test_options_min
    assert_nothing_raised do
      exe( "bin/transcoder --in test/data/black-720x480.mp4 --format test/data/test_script_format.fmt" )
    end
  end

  # def test_options_overwrite_error
  #   assert_raise ExecutionException do
  #     exe( "bin/transcoder --in test/data/black-720x480.mp4 --format test/data/test_script_format.fmt --out test/data/overwrite-me.flv" )
  #   end
  # end

  # def test_options_overwrite
  #   assert_raise ExecutionException do
  #     exe( "bin/transcoder --in test/data/black-720x480.mp4 --format test/data/test_script_format.fmt --out test/data/overwrite-me.flv --overwrite" )
  #   end
  # end
end