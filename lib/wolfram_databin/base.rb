require 'rubygems'
require 'hurley'
module WolframDatabin
  class Base
  attr_accessor :shortid, :uri, :debug_flag, :clnt
  
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
  def get_url2
    "https://datadrop.wolframcloud.com/api/v1.0"
  end
  def self.submit_data(tshortid,aquery)
    dbin=WolframDatabin::Base.new
    dbin.set_shortid(tshortid)
    puts "WolframDatabin Gem: posting #{dbin.datadrop_url} with #{aquery.inspect}  at #{Time.now}"
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
  def build_client
    if @clnt==nil then
    # @clnt=HTTPClient.new 
     @clnt=Hurley::Client.new  self.get_url2
    end
    @clnt
  end
  def post_data(query)
    raise "short id not set" if self.shortid==nil
      res=''
      qdata={bin: self.shortid}.merge(self.fix_query(query))
      begin
        timeout=40
         # @uri=URI.parse(self.get_url)
        # c = Hurley::Client.new "https://datadrop.wolframcloud.com/api/v1.0"
        # c.get "Add", :time => Time.now.iso8601, :fred => "hello"
         # q=self.get_url + Hurley::Query::Flat.new(qdata).to_s
        #  puts "url #{q} query #{qdata}" if self.debug_flag
         # res=Hurley.get(q)
         @clnt=self.build_client
         @clnt.request_options.timeout = timeout   # set to 60
         
         res=@clnt.get "Add", qdata
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



 
 
