= send_csv

* https://github.com/ouvrages/send_csv

== DESCRIPTION:

Adds to ApplicationController a send_csv method working like send_file.

== SYNOPSIS:

  class MyController < ApplicationController
    def export
      lines = []
      lines << ["Name", "e-mail"]
      lines += User.all.map { |user| [user.name, user.email] }
      send_csv(lines, :filename => "exported_users.csv")
    end
  end

== REQUIREMENTS:

* csv (bundled with Ruby)
* ApplicationController with a #send_file method (bundled with Rails)

== INSTALL:

* add this to your Gemfile and run "bundle install":
  gem "send_csv"

== DEVELOPERS:

After checking out the source, run:

  $ rake newb

This task will install any missing dependencies, run the tests/specs,
and generate the RDoc.

== LICENSE:

(The MIT License)

Copyright (c) 2011 Ouvrages

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
