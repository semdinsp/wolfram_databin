[![Build Status](https://travis-ci.org/semdinsp/wolfram_databin.svg?branch=master)](https://travis-ci.org/semdinsp/wolfram_databin)[![Code Climate](https://codeclimate.com/github/semdinsp/wolfram_databin/badges/gpa.svg)](https://codeclimate.com/github/semdinsp/wolfram_databin)
[![Gem Version](https://badge.fury.io/rb/wolfram_databin.png)](http://badge.fury.io/rb/wolfram_databin)

Wolfram Databin
============

post data to  a wolfram databin

Test URL
=======
    http://wolfr.am/4PZWVcDT

Usage
=======

    @dbin=WolframDatabin::Base.new
    @dbin.set_shortid("4PZWVcDT")
    query= {time: time }
    res=@dbin.post_data(query)
    
