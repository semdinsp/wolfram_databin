puts File.dirname(__FILE__)
require File.dirname(__FILE__) + '/test_helper.rb' 


class HwidTest <  Minitest::Test

  def setup
    @dbin=WolframDatabin::Base.new
    @dbin.shortid="4PZWVcDT"
  end
  
 
  def test_shortid
    assert @dbin.get_shortid=="4PZWVcDT", "return id wrong #{@dbin.get_shortid}"
  end
  def test_creation
     assert @dbin!=nil, "should be created"
  end
 
    
end
  
 
 