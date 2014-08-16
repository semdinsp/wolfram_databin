[![Build Status](https://travis-ci.org/semdinsp/hwid.png)](https://travis-ci.org/semdinsp/hwid)
[![Code Climate](https://codeclimate.com/repos/524654d9c7f3a31b29038e3a/badges/58ed8386e3e6d266c7ac/gpa.png)](https://codeclimate.com/repos/524654d9c7f3a31b29038e3a/feed)
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

    @hwid.systemid
