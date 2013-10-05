tuple
=========

[![Build Status](https://travis-ci.org/Yonaba/tuple.lua.png)](https://travis-ci.org/Yonaba/tuple.lua)


###Tuples ?

*Quoted from [Wikipedia](http://en.wikipedia.org/wiki/Tuple):*
>In mathematics, computer science, linguistics, and philosophy, a tuple is an >ordered list of elements. In set theory, an (ordered) n-tuple is a sequence (or >ordered list) of n elements, where n is a non-negative integer.


*tuple* is a minimal implementation of *ordered n-tuples* in Lua. I started working on it as a dependency for some personal work, then I dediced to wrap it and share it as a standalone module.

###Installation

####Git

    git clone git://github.com/Yonaba/tuple.lua

####Download

* See [releases](https://github.com/Yonaba/tuple.lua/releases)

####LuaRocks

    luarocks install tuple
    
####MoonRocks

    moonrocks install tuple

or 

    luarocks install --server=http://rocks.moonscript.org/manifests/Yonaba tuple
    
### Usage

Place the file [tuple.lua](tuple.lua) in your project and use [require](http://pgl.yoyo.org/luai/i/require) in your code where desired.

    local tuple = require "tuple"

### Documentation

See [doc.md](docs/doc.md).

### Specification

This project includes specification tests. You can run the included specs with [Telescope](https://github.com/norman/telescope) using the following 
command from the root foolder:

    lua tsc -f specs/*

### License

This work is under [MIT-LICENSE](http://www.opensource.org/licenses/mit-license.php)<br/>
Copyright (c) 2013 Roland Yonaba

    Permission is hereby granted, free of charge, to any person obtaining a
    copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/Yonaba/tuple.lua/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

