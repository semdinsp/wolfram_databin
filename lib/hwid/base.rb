require 'rubygems'

module Hwid
  def self.systemid
    Hwid::Base.new.systemid
  end
  class Base
    attr_accessor :systemid
  
    def platform
    end
    #parse something like 'Serial : xxxx'
    def parse(line)
      res='unknown'
      raw=line.split(':')
      res=raw[1] if raw[1]!=nil
      res.strip
    end
    def systemid
      rasp=(/arm-linux/ =~ RUBY_PLATFORM) != nil
      mac=(/darwin/ =~ RUBY_PLATFORM) != nil
      linux=(/linux/ =~ RUBY_PLATFORM) != nil
      return get_rasp_id if rasp
      return get_mac_id if mac
      return get_linux_id if linux
    end
    def get_rasp_id
      res=`grep Serial  /proc/cpuinfo` 
      self.parse(res)
    end
    def get_mac_id
      res=`system_profiler SPHardwareDataType -timeout 0 | grep Serial` 
      self.parse(res)
    end
    def get_linux_id
      res=`ifconfig |grep HWaddr`.split.last
    end

   end    # Class
end    #Module