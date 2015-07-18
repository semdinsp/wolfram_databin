[![Build Status](https://travis-ci.org/semdinsp/wolfram_databin.svg)](https://travis-ci.org/semdinsp/wolfram_databin)[![Code Climate](https://codeclimate.com/github/semdinsp/wolfram_databin/badges/gpa.svg)](https://codeclimate.com/github/semdinsp/wolfram_databin)
[![Gem Version](https://badge.fury.io/rb/wolfram_databin.png)](http://badge.fury.io/rb/wolfram_databin)

Wolfram Databin
============

Post data to  a wolfram databin.  You can post just about any kind of string data to the databin.  Just add more stuff to the query hash and send it.  The bin id is merged with the query hash so no need  to add the bin id to the query.

Note that Mathematica does not like underscores so they are converted to U like mathematica does for  Java.    This means that your query contents are converted from symbols to string but this has not impact on the data except that the key with an underscore now has  a U in it.  (eg if you send weekly_revenue  it looks like weeklyUrevenue in the datadrop)

Test URL
=======
    http://wolfr.am/4PZWVcDT

Usage
=======

    @dbin=WolframDatabin::Base.new
    @dbin.set_shortid("4PZWVcDT")
    query= {time: Time.now}
    res=@dbin.post_data(query)
    
One shot usage
==============
    WolframDatbin::Base.submit_data("4PZWVcDT",{time: Time.now})