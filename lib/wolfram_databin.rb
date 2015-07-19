$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
  Dir[File.join(File.dirname(__FILE__), 'wolfram_databin/**/*.rb')].sort.each { |lib| require lib }
  

module WolframDatabin
  VERSION = '0.0.1'
  def self.submit_data(tshortid,aquery)
    dbin=WolframDatabin::Base.new
    dbin.submit_data(tshortid,aquery)
  end
end