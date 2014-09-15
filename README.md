[![Build Status](https://travis-ci.org/semdinsp/hwid.svg?branch=master)](https://travis-ci.org/semdinsp/hwid)[![Code Climate](https://codeclimate.com/github/semdinsp/hwid/badges/gpa.svg)](https://codeclimate.com/github/semdinsp/hwid)
[![Gem Version](https://badge.fury.io/rb/hwid.png)](http://badge.fury.io/rb/hwid)

hwid gem
============

return the hardware id of the system the gem is running on.

Simple hwid id
=====================
THis is not secure but gives  a simple way to identify the hardware from a particular client application.

It is a bit slow so perhaps only call it upon startup

Usage
=======

    Hwid.systemid
    
