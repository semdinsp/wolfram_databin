require 'rubygems'

module WolfrramDatabin
  class Base
  attr_accessor :shortid, :uri
  
  def set_bin(atid)
    self.shortid=atid
  end
  
  def get_url
    url="https://datadrop.wolframcloud.com/api/v1.0/Add?"
    url
  end
  def post_data(query)
    raise "short id not set" if self.shortid==nil
      res=''
      qdata={bin: self.shortid}.merge(query)
      begin
        Timeout::timeout(40) do    
          @uri=URI.parse(self.get_url)
          clnt = HTTPClient.new
          res=clnt.get(@uri,qdata)
        end
       rescue  Exception => e
         puts "Exception: #{e.inspect}"
       ensure
          puts "result: #{res.inspect}   query #{u}bin: #{bin}  url: #{url}"
       end
       res
  end

   end    # Class
end    #Module



 
 
