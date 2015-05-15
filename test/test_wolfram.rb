require File.dirname(__FILE__) + '/test_helper.rb' 


class WolframDatabinTest <  Minitest::Test

  def setup
    @dbin=WolframDatabin::Base.new
    @dbin.set_shortid("4PZWVcDT")
  end
  
  def test_debug_flag
    assert !@dbin.debug_flag, "debug flag wrong"
    @dbin.debug
    assert @dbin.debug_flag, "debug flag wrong"  
  end
  def test_shortid
    assert @dbin.shortid=="4PZWVcDT", "return id wrong #{@dbin.shortid}"
  end
  def test_creation
     assert @dbin!=nil, "should be created"
  end
  
  def test_postdatabin
    time=Time.now
    query= {time: time }
    res=@dbin.post_data(query)
    puts  "result is #{res}"
    assert res[:success], "response should be success #{res}"
  end
 
    
end
  
 
 