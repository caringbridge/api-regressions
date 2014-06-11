# CaringBridge API Regression Tests

## Overview
You don't care about this unless you work at CaringBridge.

## But I *do* work at CaringBridge! ##

    git clone git@github.com:vandahm/api-regressions.git
    cd api-regressions
    bundle install
    bundle exec rspec -f d

## What's with all the pending specs? ##
I can only work on this in my free time, so I can't write all the specs myself.
I wrote a script to parse our API controllers, extract the service and method names,
and generate blank specs to serve as placeholders to get this done.

## What is rspec? ##
It's an automated testing tool to support Behavior-Driven Development. Take a look
at [the project's website](http://rspec.info/) if you want to know more.

## Why are you using Ruby? ##
Aaron knows Ruby and uses to write our other regression tests. Besides, anything
is better than PHPUnit.

