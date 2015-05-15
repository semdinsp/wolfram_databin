require 'rubygems'
require 'httpclient'
module WolframDatabin
  class Base
  attr_accessor :shortid, :uri, :debug_flag
  
  def set_shortid(atid)
    self.shortid=atid
  end
  def initialize
    self.debug_flag=false
  end
  def debug
    self.debug_flag=true
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
          puts "uri #{@uri}" if self.debug_flag
          @uri=URI.parse(self.get_url)
          clnt = HTTPClient.new
          res=clnt.get(@uri,qdata)
        end
       rescue  Exception => e
         puts "Exception: #{e.inspect}"
       ensure
          puts "result: #{res.inspect}   query #{qdata} bin: #{self.shortid}  url: #{@uri.inspect}" if self.debug_flag
       end
       if res.is_a?(HTTP::Message)
          return {success: res.body.include?('successfully added'), result: res} 
        else
          return {success: false, result: res}   
        end
    end

   end    # Class
end    #Module



 
 
