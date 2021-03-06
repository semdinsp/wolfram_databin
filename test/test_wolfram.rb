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
  def test_datadrop_url
     assert @dbin.datadrop_url=="http://wolfr.am/4PZWVcDT", "should have short id #{@dbin.datadrop_url}"
  end
  def test_query_fixer
    time=Time.now
    query= {time: time, new_time: time }
    res=@dbin.fix_query(query)
    assert res[:time]==nil, "symbol to string unchanged"
    assert res['time']==time, "time unchanged"
    assert res[:new_time]==nil, "new time nil"
    assert res['newUtime']==time, "new time has U rather than underscore"
  end
  
  def test_postdatabin
    time=Time.now
    query= {time: time }
    res=@dbin.post_data(query)
    puts  "result is #{res}"
    assert res[:success], "response should be success #{res}"
  end
  def test_submit
    res=@dbin.submit_data("4PZWVcDT",{submit_time: Time.now})
    assert res[:success], "response should be success #{res}  #{@dbin.datadrop_url}"
    
  end
  def test_toplevel_submit_classs
    res = WolframDatabin.submit_data("4PZWVcDT",{submit_class: Time.now})
    assert res[:success], "response should be success #{res} "
    
  end
  def test_submit_class
    res = WolframDatabin::Base.submit_data("4PZWVcDT",{classubmittime: Time.now})
    assert res[:success], "response should be success #{res} "
    
  end
 
    
end
  
 
 