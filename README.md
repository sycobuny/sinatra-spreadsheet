Sinatra::Spreadsheet
====================

Simple Sinatra rendering extension for spreadsheets using the Spreadsheet gem.

Installation
============

Currently you must source this gem from GitHub, and the easiest way to do that
is through [Bundler][] (you **are** using Bundler, right?):

```ruby
gem 'sinatra-spreadsheet',
    :require => 'sinatra/spreadsheet',
    :git     => 'git://github.com/sycobuny/sinatra-spreadsheet.git'
```

Usage
=====

Create a template file named `yourtemplate.spreadsheet` in your views directory,
and render it like you would any other template in Sinatra (while making sure to
set the appropriate content type and disposition):

```ruby
get '/yourtemplate.xls' do
    response['Content-Disposition'] = "attachment; filename=yourtemplate.xls"
    content_type 'application/excel'

    spreadsheet :yourtemplate
end
```

The template will be executed as pure ruby, with a variable pre-existing named
`workbook` which contains the current Spreadsheet object.

```ruby
# yourtemplate.spreadsheet
worksheet = workbook.create_worksheet(:name => 'My First Worksheet')
worksheet.row(0).concat(%w(Question Answer))
worksheet.row(1).concat(["Isn't writing spreadsheets cool?", "Yes"])
```

Credits
=======

I wrote Sinatra::Spreadsheet, but it is based almost entirely off of the very
simple and easy-to-use [sinatra-prawn][] gem from [S. Brent Faulkner][]. I
basically took his code and did a (slightly more involved) :%s on it.

[Bundler]:           http://gembundler.com/
[sinatra-prawn]:     https://github.com/sbfaulkner/sinatra-prawn
[S. Brent Faulkner]: http://unwwwired.net/
