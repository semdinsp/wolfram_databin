require 'rubygems'
require 'hurley'
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
  def datadrop_url
    "http://wolfr.am/#{self.shortid}"
  end
  def get_url
    url="https://datadrop.wolframcloud.com/api/v1.0/Add?"
    url
  end
  def self.submit_data(tshortid,aquery)
    dbin=WolframDatabin::Base.new
    dbin.submit_data(tshortid,aquery)
  end
  def fix_query(query)
    #need to remove underscores
    fixed={}
    query.each {|k,v|   fixed[k.to_s.gsub('_',"U")]=v}
   # puts "fixed is #{fixed}  query is #{query}"
    fixed
    
  end
  def submit_data(tshortid,aquery)
    self.set_shortid(tshortid)
 #   puts "INSPECT  POST #{self.shortid} query: #{aquery}"
   # self.debug
    res=self.post_data(aquery)
    res
  end
  def post_data(query)
    raise "short id not set" if self.shortid==nil
      res=''
      qdata={bin: self.shortid}.merge(self.fix_query(query))
      begin
        Timeout::timeout(40) do    
         # @uri=URI.parse(self.get_url)
          q=self.get_url + Hurley::Query::Flat.new(qdata).to_s
          puts "url #{q} query #{qdata}" if self.debug_flag
          res=Hurley.get(q)
        end
       rescue  Exception => e
         puts "Exception: #{e.inspect}"
       ensure
          puts "result: #{res.inspect}   query #{qdata} bin: #{self.shortid}  url: #{@uri.inspect}" if self.debug_flag
       end
       #if res.is_a?(HTTP::Message)
       if res.is_a?(Hurley::Response) 
          return {success: res.body.include?('successfully added'), result: res} 
        else
          return {success: false, result: res}   
        end
    end

   end    # Class
end    #Module



 
 
